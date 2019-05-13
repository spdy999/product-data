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
            if (position.isOdd) return Divider();
            return Column(children: [
              Text(
                '${articles[position].number}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                '${articles[position].description}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Unit Packs',
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pack Price',
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Value Included Vat',
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${articles[position].unitPacks}',
                      textScaleFactor: 1.8,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${articles[position].packPrice}',
                      textScaleFactor: 3.0,
                      textAlign: TextAlign.center,
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
              )
            ], crossAxisAlignment: CrossAxisAlignment.start);
          }),
    );
  }
}
