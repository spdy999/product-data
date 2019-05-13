import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'article.dart';
import 'listarticles.dart';

Future<List<Article>> fetchArticles(http.Client client) async {
  final response = await client.get('http://192.168.1.35:4001/articles');

  return compute(parseArticles, response.body);
}

List<Article> parseArticles(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Article>>(
        future: fetchArticles(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewArticles(articles: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
