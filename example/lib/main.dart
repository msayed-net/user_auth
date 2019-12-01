import 'package:flutter/material.dart';
import 'dart:async';
import 'package:user_auth/user_auth.dart';

// ---- user instance ----- //
UserAuth user = new UserAuth();

// ---- vars ---- //
var activeUser, checkedUser, loggedOut = false;

Future main() async {
  // ---- user init ---- //
  await user.init(
    apiBaseUrl: 'https://mazeg.adortyyy.com/api/',
    userNameParam: 'email',
    passwordParam: 'password',
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loggedOut = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin Example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Login'),
                onPressed: () async {
                  activeUser = await user.login(
                    username: 'vendor@test.com',
                    password: '123456',
                  );
                  loggedOut = false;
                  setState(() {});
                },
              ),
              Text('login..'),
              activeUser != null
                  ? Text(activeUser.toString())
                  : Text(user.placeHolder()),
              Divider(height: 40),
              RaisedButton(
                child: Text('Check'),
                onPressed: () async {
                  checkedUser = await user.check(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  );
                  setState(() {});
                },
              ),
              Text('check..'),
              checkedUser != null
                  ? Text(checkedUser.toString())
                  : Text(user.placeHolder()),
              Divider(height: 40),
              RaisedButton(
                child: Text('Logout'),
                onPressed: () async {
                  loggedOut = await user.logout(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  );
                  activeUser = checkedUser = null;
                  setState(() {});
                },
              ),
              Text('logout..'),
              Text(loggedOut.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
