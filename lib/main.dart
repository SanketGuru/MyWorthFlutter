import 'package:flutter/material.dart';
import 'package:flutter_app/data/Folio.dart';
import 'package:flutter_app/view/AddEditFolio.dart';
import 'package:flutter_app/view/FilioTab.dart';
import 'package:flutter_app/view/LiabilityTab.dart';

import 'resources/stringResource.dart';

void main() async {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.amberAccent),
        home: SafeArea(child: TabbedPage()));
  }
}

class TabbedPage extends StatefulWidget {
  const TabbedPage({Key key}) : super(key: key);

  @override
  _TabbedPageState createState() => new _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> mTabs = <Tab>[
    Tab(text: StringResource.asset),
    Tab(text: StringResource.liability),
  ];
//  final List<Widget> mTabsScreen = <Widget>[
//    FolioTab(),
//    LiabilityTab(),
//  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: mTabs.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(StringResource.appName),
        bottom: new TabBar(
          controller: _tabController,
          tabs: mTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FolioTab(),
          LiabilityTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          actionAddButtonClicked(_tabController.index);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void actionAddButtonClicked(int action) {
    switch (action) {
      case 0:
        //Add folio
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FolioForm(Folio(0, '', ""))),
        );
        //   mTabsScreen[action];
        break;
      case 1:
        //Add Liability
        // mTabsScreen[action];
        break;
      default:
        break;
    }
  }
}
