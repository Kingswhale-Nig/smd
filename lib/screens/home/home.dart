import 'package:flutter/material.dart';
import 'package:smd/screens/home/report/report.dart';
import 'package:smd/screens/home/setting.dart';
import 'package:smd/services/auth.dart';

class Home extends StatelessWidget {
  
final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    final smdimage = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/logo.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to SM Dynamics Nigeria Ltd.',
        style: TextStyle(fontSize: 28.0, color: Colors.redAccent),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        ' SM Dynamics is a multi-dimentional company ... lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor.',
        style: TextStyle(fontSize: 16.0, color: Colors.redAccent),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
        ]),
      ),
      child: Column(
        children: <Widget>[smdimage, welcome, lorem],
      ),
    );

    final drawer = Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              'SMD Technician',
              style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
            ),
            accountEmail: Text(
              'User@smdynamics.com.ng',
              style: TextStyle(color: Colors.redAccent),
            ),
            currentAccountPicture: Icon(
              Icons.account_circle,
              size: 64.0,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          ListTile(
            title: Text(
              'Activities Report',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            leading: Icon(
              Icons.report_problem,
              color: Colors.redAccent,
            ),
            subtitle: Text('Daily Activities report.'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Report()));
            },
          ),
          ListTile(
            title: Text(
              'Complaint Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            leading: Icon(
              Icons.share,
              color: Colors.redAccent,
            ),
            subtitle: Text('Check for feedback'),
            // onTap: () {
            //   Navigator.pop(context);
            //   Navigator.pushNamed(context, '/firestore_test_screen');
            // },
          ),
          ListTile(
            title: Text(
              'FAQ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            leading: Icon(
              Icons.info,
              color: Colors.redAccent,
            ),
            subtitle: Text('Frequently asked questions'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/help_screen');
            },
          ),
          ListTile(
            title: Text(
              'Contact us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.redAccent,
            ),
            subtitle: Text('Having issues with the app?'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.redAccent,
            ),
            subtitle: Text('Sign out'),
            onTap: () async {
              Navigator.pop(context);
              await _auth.signOut();
            },
          ),
        ],
      ),
    );

    final appBar = AppBar(
      title: Text('Home', style: TextStyle(color: Colors.white),),
      iconTheme: new IconThemeData(color: Colors.white),
      backgroundColor: Colors.redAccent,
      actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.settings, color: Colors.white),
            label: Text('Setting', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
            },

          ),
        ],
    );

    
    final floatingActionButton = FittedBox(
      child: RaisedButton(
        shape: StadiumBorder(),
        onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Report()));
        },
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        color: Colors.redAccent,
        splashColor: Colors.white,
        elevation: 12.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Create Report',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            width: 5.0,
          ),
          Icon(Icons.add_comment, color: Colors.white),
        ]),
      ),
    );

    return Scaffold(
      //bottomNavigationBar: bottomNavigationBar,
      body: body,
      drawer: drawer,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
    );
  }
}