# user_auth

Dart - Backend user auth helpe, with common methods

[![Pub](https://img.shields.io/badge/Get%20library-pub-blue)](https://pub.dev/packages/user_auth)
[![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/user_auth#-example-tab-)

### Show some :heart: and star the repo

[![Fork](https://img.shields.io/github/forks/msayed-net/user_auth?style=social)](https://github.com/msayed-net/user_auth/fork)
[![Star](https://img.shields.io/github/stars/msayed-net/user_auth?style=social)](https://github.com/msayed-net/user_auth/stargazers)
[![Watch](https://img.shields.io/github/watchers/msayed-net/user_auth?style=social)](https://github.com/msayed-net/user_auth/) 

## usage
* import `package:user_auth/user_auth.dart`.
* create instance from `UserAuth`.
* init with `apiBaseUrl` and other parameters.

## methods
* `login` : waits for `user` in response to return. 
* `check` : waits for `user` in response to return.  
* `logout` : return `true` | `false`.
* `loadUser` : return `user` if stored in prefs.
* `register` : waits for `user` in response to return. 

## example
```dart
import 'package:user_auth/user_auth.dart';

// instance
UserAuth user = new UserAuth();

// init
SharedPreferences prefs = await SharedPreferences.getInstance();
  await user.init(
    apiBaseUrl: 'https://example.com/api',
    store: true,
    prefs: prefs, // need if store: true
    loginUrl: "/user/login",
    registerUrl: "/user/register",
    checkUrl: "/user/details",
    logoutUrl: "/user/logout",
  );

// Note : change 'Bearer ' and api_token with your own parameters

// login
var activeUser = loadedUser = await user.login(
                    usernameVar: 'email',
                    usernameVal: 'test@test.com',
                    password: '12345678',
                  );

// check
var checkedUser = await user.check(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  ); 

// logout
var logout = await user.logout(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  );

// register
Map form = {
            "email" : "test@test.com",
            "phone" : "00000000",
            "name" : "mohamed sayed",
            "password" : "1234567",
            };
registeredUser = await user.register(form: form);
```
