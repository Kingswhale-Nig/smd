import 'package:flutter/material.dart';
import 'package:smd/shared/constants.dart';


class ScannerReport extends StatefulWidget {
  @override
  _ScannerReportState createState() => _ScannerReportState();
}

class _ScannerReportState extends State<ScannerReport> {
  @override
  Widget build(BuildContext context) {
    final openingInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: textInputDecoration.copyWith(hintText: 'Enter number opening Scanner'),
    );

    final receivedInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: textInputDecoration.copyWith(hintText: 'Enter number of scanner recieved'),
    );

    final fixedInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: textInputDecoration.copyWith(hintText: 'Enter number of scanner fixed'),
    );

    final fixedReturnedInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: textInputDecoration.copyWith(hintText: 'Enter number of scanner fixed (returned)'),
    );

    final irreparableInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: textInputDecoration.copyWith(hintText: 'Enter number  of irreparable'),
    );

    final closingInput = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      decoration: textInputDecoration.copyWith(hintText: 'Enter number of closing scanner'),
    );

    final submitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed(HomePage.tag);
        },

          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          color: Colors.redAccent,
          splashColor: Colors.white,
          elevation: 12.0,
        child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
      ),
    );


    // final welcome = Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Text('Scanner Report',
    //       style: TextStyle(
    //         fontSize: 28.0,
    //         color: Colors.redAccent,
    //       ),
    //       textAlign: TextAlign.center),
    // );

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
          irreparableInput,
          SizedBox(height: 15.0),
          closingInput,
          SizedBox(height: 15.0),
          submitButton
        ],
      ),
    );

    return Scaffold(body: body);
  }
}
