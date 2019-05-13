import 'package:flutter/material.dart';
import 'article.dart';

class ListViewArticles extends StatelessWidget {
  final List<Article> articles;

  ListViewArticles({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: articles.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${articles[position].description}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${articles[position].description}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 35.0,
                        child: Text(
                          'User ${articles[position].number}',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () => _onTapItem(context, articles[position]),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Article article) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content:
            new Text(article.number.toString() + ' - ' + article.description)));
  }
}
