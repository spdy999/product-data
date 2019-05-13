import 'package:flutter/material.dart';
import 'article.dart';
import 'listarticles.dart';

class DataSearch extends SearchDelegate<String> {
  final Future<List<Article>> articles;

  DataSearch({this.articles});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: articles,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final numberList =
            snapshot.data.map((article) => article.number).toList();
        print(numberList[0]);

        final suggestionList = query.isEmpty ? numberList : numberList;

        print(suggestionList);
        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
                title: Text(suggestionList[index]),
              ),
          itemCount: suggestionList.length,
        );
      },
    );
  }
}
