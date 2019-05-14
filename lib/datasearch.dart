import 'package:flutter/material.dart';
import 'article.dart';

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
    return Card(
      child: Center(
        child: Text(query),
      ),
    );
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
        var newObject = {};
        for (var i = 0; i < snapshot.data.length; i++) {
          var number = snapshot.data[i].number;
          numberList.add(number);
          newObject[number] = snapshot.data[i];
        }

        final suggestionList = query.isEmpty
            ? ['8850348204071', '8851932369001', '8851932369411']
            : numberList.where((p) => p.startsWith(query)).toList();

        // return ListView.separated(
        //   itemBuilder: (context, index) {
        //     return InkWell(
        //       child: Stack(
        //         children: <Widget>[
        //           Container(
        //             padding:
        //                 EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        //             child: Column(
        //               children: [
        //                 ListTile(
        //                   title: Text(
        //                     suggestionList[index],
        //                     style: TextStyle(fontSize: 20.0),
        //                   ),
        //                   subtitle: Text(
        //                       newObject[suggestionList[index]].description),
        //                 )
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     );
        //   },
        //   separatorBuilder: (context, index) => Divider(
        //         height: 1.0,
        //       ),
        //   itemCount: suggestionList.length,
        // );

        return ListView.builder(
            itemCount: suggestionList.length,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              if (index.isOdd) return Divider();
              return Column(children: [
                Text(
                  suggestionList[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                Text(
                  '${newObject[suggestionList[index]].description}',
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
                        '${newObject[suggestionList[index]].unitPacks}',
                        textScaleFactor: 1.8,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${newObject[suggestionList[index]].packPrice}',
                        textScaleFactor: 3.0,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${newObject[suggestionList[index]].valueIncludedVat}',
                        textScaleFactor: 1.8,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )
              ], crossAxisAlignment: CrossAxisAlignment.start);
            });

        // return ListView.builder(
        //   itemBuilder: (context, index) => ListTile(
        //         onTap: () {
        //           showResults(context);
        //         },
        //         title: RichText(
        //           text: TextSpan(
        //               text: suggestionList[index].substring(0, query.length),
        //               style: TextStyle(
        //                   color: Colors.black, fontWeight: FontWeight.bold),
        //               children: [
        //                 TextSpan(
        //                     text: suggestionList[index].substring(query.length),
        //                     style: TextStyle(color: Colors.grey))
        //               ]),
        //         ),
        //         // title: Text(suggestionList[index]),
        //       ),
        //   itemCount: suggestionList.length,
        // );
      },
    );
  }
}
