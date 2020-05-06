import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smd/models/user.dart';
import 'package:smd/screens/home/report/scanner_report.dart';
import 'package:smd/services/database.dart';
import 'package:smd/shared/constants.dart';
import 'package:smd/shared/loading.dart';

class KitReport extends StatefulWidget {
  _KitReportState createState() => _KitReportState();
}

class _KitReportState extends State<KitReport> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  String openingKit;
  String receivedKit;
  String fixedKit;
  String returnedFixedKit;
  String kitFixedNotRetruned;
  String irreparableKit;
  String closingKit;

  //DatabaseService _databaseService = new DatabaseService();

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('SMD Kit Report', style: TextStyle(fontSize: 15.0)),
            content: Text('You have successfully submited'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    final openingInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() {
          this.openingKit = val;
          print(val);
        });
      },
      decoration:
          textInputDecoration.copyWith(hintText: 'Enter number opening Kit'),
    );

    final receivedInput = TextFormField(
        keyboardType: TextInputType.number,
        autofocus: false,
        initialValue: '',
        validator: (val) => val.isEmpty ? 'Enter an email' : null,
        onChanged: (val) {
          setState(() {
            this.receivedKit = val;
            print(val);
          });
        },
        decoration: textInputDecoration.copyWith(
            hintText: 'Enter number of Kit recieved'));

    final fixedInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() {
          this.fixedKit = val;
          print(val);
        });
      },
      decoration:
          textInputDecoration.copyWith(hintText: 'Enter number of kit fixed'),
    );

    final fixedReturnedInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() {
          this.returnedFixedKit = val;
          print(val);
        });
      },
      decoration: textInputDecoration.copyWith(
          hintText: 'Enter number of kit fixed (returned)'),
    );

    final notReturnedInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() {
          this.kitFixedNotRetruned = val;
          print(val);
        });
      },
      decoration: textInputDecoration.copyWith(
          hintText: 'Enter Kit fixed and returned TagID'),
    );

    final irreparableInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() {
          this.irreparableKit = val;
          print(val);
        });
      },
      decoration: textInputDecoration.copyWith(
          hintText: 'Enter number  of irreparable '),
    );

    final closingInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() {
          closingKit = val;
          print(val);
        });
      },
      decoration:
          textInputDecoration.copyWith(hintText: 'Enter number of closing Kit'),
    );

    final submitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () async {
          setState(() => loading = true);
          await DatabaseService(uid: user.uid).addData({
            '1_openingKit': openingKit,
            '2_receivedKit': receivedKit,
            '3_fixedKit': fixedKit,
            '4_returnedFixedKit': returnedFixedKit,
            '5_kitFixedNotRetruned': kitFixedNotRetruned,
            '6_irreparableKit': irreparableKit,
            '7_closingKit': closingKit,
          }).then((result) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScannerReport()));
          }).catchError((e) {
            print(e);
          });
          Navigator.pop(context);
        },
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        color: Colors.redAccent,
        splashColor: Colors.white,
        elevation: 12.0,
        child: Text('NEXT  >', style: TextStyle(color: Colors.white)),
      ),
    );

    final body = Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          //welcome,
          openingInput,
          SizedBox(height: 15.0),
          receivedInput,
          SizedBox(height: 15.0),
          fixedInput,
          SizedBox(height: 15.0),
          fixedReturnedInput,
          SizedBox(height: 15.0),
          notReturnedInput,
          SizedBox(height: 15.0),
          irreparableInput,
          SizedBox(height: 15.0),
          closingInput,
          SizedBox(height: 15.0),
          submitButton,
        ],
      ),
    );

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Loading();
          } else {
            return Scaffold(
              key: _formKey,
              body: body,
            );
          }
        });
  }
}
