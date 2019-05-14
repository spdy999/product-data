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
        var numberList = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          numberList.add(snapshot.data[i].number);
        }

        final suggestionList = query.isEmpty
            ? ['8850348204071', '8851932369001', '8851932369411']
            : numberList.where((p) => p.startsWith(query)).toList();

        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
                title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: suggestionList[index].substring(query.length),
                            style: TextStyle(color: Colors.grey))
                      ]),
                ),
                // title: Text(suggestionList[index]),
              ),
          itemCount: suggestionList.length,
        );
      },
    );
  }
}
