import 'package:flutter/material.dart';

import '../data/Folio.dart';

class FolioTab extends StatefulWidget {
  _FolioTabState createState() => _FolioTabState();
}

class _FolioTabState extends State<FolioTab> {
  List<Folio> folioList = new List(0);
  // FolioRepoImpl db = new FolioRepoImpl();

  @override
  void initState() {
    super.initState();
//    db.db.open('pathNet.db').then((value) => {
//          db.getFolio().then((value) => {
//                setState(() {
//                  folioList = value;
//                })
//              })
//        });
  }

  @override
  Widget build(BuildContext cntext) {
    return getList();
//        Column(
//      children: <Widget>[
//        Text('Total'),
//        getList(),
//      ],
    //   );
  }

  Widget getList() => RefreshIndicator(
      onRefresh: () {},
      child: ListView.builder(
        itemCount: folioList.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              /*       Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FololioScreen('Asset $position')),
            );*/
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'hh ${folioList[position].toString()}',
                  // 'hh $position ',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          );
        },
      ));
}
