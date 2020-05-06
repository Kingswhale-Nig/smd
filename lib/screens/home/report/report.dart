import 'package:flutter/material.dart';
import 'package:smd/screens/home/report/kit_report.dart';
import 'package:smd/screens/home/report/scanner_report.dart';
import 'package:smd/screens/home/report/spares_report.dart';

// Creating a model for Appbar title navigation.
class AppBarTitle {
  const AppBarTitle(this.title);
  final String title;
}

const List<AppBarTitle> allAppBarTitles = <AppBarTitle>[
  AppBarTitle('Kit Report'),
  AppBarTitle('Scanner Report'),
  AppBarTitle('Spare Report'),
];

class Report extends StatefulWidget {
  const Report({Key key, this.appbartitle}) : super(key: key);

  final AppBarTitle appbartitle;

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int _currentIndex = 0;
  final _pageOptions = [
    KitReport(),
    ScannerReport(),
    SparesReport(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: IndexedStack(
          alignment: AlignmentDirectional.center,
          index: _currentIndex,
          children: [
            Text(
              'Kit Report',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Spare Report',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Scanner Report',
              style: TextStyle(color: Colors.white),
            ),
          ]),
      iconTheme: new IconThemeData(color: Colors.white),
      backgroundColor: Colors.redAccent,
    );

    final bottomNavigationBar = BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new
      items: [
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.tab,
            color: Colors.black,
          ),
          title: Text('Kit',
              style: new TextStyle(
                  color: _currentIndex == 0 ? Colors.redAccent : Colors.black)),
          activeIcon: Icon(
            Icons.tab,
            size: 30,
            color: Colors.redAccent,
          ),
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.desktop_mac,
            color: Colors.black,
          ),
          title: Text('Spares',
              style: new TextStyle(
                  color: _currentIndex == 1 ? Colors.redAccent : Colors.black)),
          activeIcon: Icon(
            Icons.desktop_mac,
            size: 30,
            color: Colors.redAccent,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.touch_app,
            color: Colors.black,
          ),
          title: Text('Scanner',
              style: new TextStyle(
                  color: _currentIndex == 2 ? Colors.redAccent : Colors.black)),
          activeIcon: Icon(
            Icons.touch_app,
            size: 30,
            color: Colors.redAccent,
          ),
        )
      ],
    );

    final body = Center(
      child: IndexedStack(
        alignment: AlignmentDirectional.center,
        index: _currentIndex,
        children: <Widget>[KitReport(), SparesReport(), ScannerReport()],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
