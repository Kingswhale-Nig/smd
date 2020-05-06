import 'package:flutter/material.dart';
import 'package:smd/services/auth.dart';
import 'package:smd/shared/loading.dart';
import 'package:smd/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final _email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() => email = val);
      },
      decoration: textInputDecoration.copyWith(hintText: 'Email'),
    );

    final _password = TextFormField(
        autofocus: false,
        obscureText: true,
        validator: (val) =>
            val.length < 6 ? 'Enter a password 6+ chars long' : null,
        onChanged: (val) {
          setState(() => password = val);
        },
        decoration: textInputDecoration.copyWith(hintText: 'Password'));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() => loading = true);
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                loading = false;
                error = 'Could not sign in with those credentials';
              });
            }
          }
        },
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        color: Colors.redAccent,
        splashColor: Colors.white,
        elevation: 12.0,
        child: Text('Sign In', style: TextStyle(color: Colors.white)),
      ),
    );

    final _errorDisplay = Text(
      error,
      style: TextStyle(color: Colors.red, fontSize: 14.0),
    );

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    logo,
                    SizedBox(height: 48.0),
                    _email,
                    SizedBox(height: 24.0),
                    _password,
                    SizedBox(height: 24.0),
                    loginButton,
                    SizedBox(height: 24.0),
                    _errorDisplay
                  ],
                ),
              ),
            ),
          );
  }
}
