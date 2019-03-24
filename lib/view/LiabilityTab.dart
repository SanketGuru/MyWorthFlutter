import 'package:flutter/material.dart';

class LiabilityTab extends StatefulWidget {
  _LiabilityTabState createState() => _LiabilityTabState();
}

class _LiabilityTabState extends State<LiabilityTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Text('Total'),
        getList(),
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  ListView getList() => ListView.builder(
        itemCount: 4,
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Liability ${position + 1}',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          );
        },
      );
}
