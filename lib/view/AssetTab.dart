import 'package:flutter/material.dart';

class AssetTab extends StatefulWidget {
  _AssetTabState createState() => _AssetTabState();
}

class _AssetTabState extends State<AssetTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
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
                'Asset ${position + 1}',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
