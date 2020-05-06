import 'package:flutter/material.dart';

class SparesReport extends StatefulWidget {
  _SparesReportState createState() => _SparesReportState();
}

class _SparesReportState extends State<SparesReport> {
  @override
  Widget build(BuildContext context) {
    
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Sapres Report',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.redAccent,
          ),
          textAlign: TextAlign.center),
    );

    final body = Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          welcome,
        ],
      ),
    );

    return Scaffold(body: body);
  }
}
