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
        onPressed: () {},
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
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = articles;

    return FutureBuilder<List<Article>>(
      future: suggestionList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        print(snapshot.data);

        return snapshot.hasData
            ? ListViewArticles(articles: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
