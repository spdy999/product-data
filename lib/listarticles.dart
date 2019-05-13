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
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, position) {
            return Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Text(
                      '${articles[position].number}',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${articles[position].description}',
                      textAlign: TextAlign.left,
                    )
                  ], crossAxisAlignment: CrossAxisAlignment.start),
                ),
                Expanded(
                  child: Text(
                    '${articles[position].unitPacks}',
                    textScaleFactor: 1.8,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${articles[position].packPrice}',
                    textScaleFactor: 3.0,
                    textAlign: TextAlign.right,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${articles[position].valueIncludedVat}',
                    textScaleFactor: 1.8,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            );
            // return Column(
            //   children: <Widget>[
            //     Divider(height: 5.0),
            //     ListTile(
            //       title: Text(
            //         '${articles[position].number}',
            //         style: TextStyle(
            //           fontSize: 22.0,
            //           color: Colors.deepOrangeAccent,
            //         ),
            //       ),
            //       subtitle: Text(
            //         '${articles[position].description} ${articles[position].unitPacks}',
            //         style: new TextStyle(
            //           fontSize: 18.0,
            //           fontStyle: FontStyle.italic,
            //         ),
            //       ),
            //       onTap: () => _onTapItem(context, articles[position]),
            //     ),
            //   ],
            // );
          }),
    );
  }

  void _onTapItem(BuildContext context, Article article) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content:
            new Text(article.number.toString() + ' - ' + article.description)));
  }
}
