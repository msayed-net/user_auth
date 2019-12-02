import 'package:flutter/material.dart';
import 'dart:async';
import 'package:user_auth/user_auth.dart';

// Note : change 'Bearer ' and api_token with your own parameters
// ---- user instance ----- //
UserAuth user = new UserAuth();

// ---- vars ---- //
var activeUser, checkedUser, loadedUser, registeredUser, loggedOut = false;

Future main() async {
  // ---- user init ---- //
  await user.init(
    apiBaseUrl: 'https://mazeg.adortyyy.com/api',
    store: true,
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
                child: Text('Load User'),
                onPressed: () async {
                  loadedUser = await user.loadUser();
                  loggedOut = false;
                  setState(() {});
                },
              ),
              Text('loaded..'),
              loadedUser != null
                  ? Text(loadedUser.toString())
                  : Text(user.placeHolder()),
              Divider(height: 40),
              RaisedButton(
                child: Text('Login'),
                onPressed: () async {
                  activeUser = loadedUser = await user.login(
                    usernameVar: 'email',
                    usernameVal: 'vendor@test.com',
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
                child: Text('Register'),
                onPressed: () async {
                  Map form = {
                    "email": "test@test.com",
                    "phone": "00000000",
                    "name": "mohamed sayed",
                    "password": "1234567",
                  };
                  registeredUser = await user.register(form: form);
                  setState(() {});
                },
              ),
              Text('register..'),
              registeredUser != null
                  ? Text(registeredUser.toString())
                  : Text(user.placeHolder()),
              Divider(height: 40),
              RaisedButton(
                child: Text('Logout'),
                onPressed: () async {
                  loggedOut = await user.logout(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  );
                  activeUser = checkedUser = loadedUser = null;
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
