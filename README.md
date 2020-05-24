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
* init with `apiBaseUrl` and optional `store`: `true` | `false`, default is `false`, if `true` plugin will store user and retrieve with `loadUser()`.

## methods
##### you may change routes to fit your API
* `login` : default route `/user/login`, waits for `user` in response to return. 
* `check` : default route `/user/details`, waits for `user` in response to return.  
* `logout` : default route `/user/details`, return `true` | `false`.
* `loadUser` : local method, return `user` if stored.
* New`register` : default route `/user/register`, waits for `user` in response to return. 

## example
```dart
import 'package:user_auth/user_auth.dart';

// instance
UserAuth user = new UserAuth();

// init
await user.init(
    apiBaseUrl: 'https://example.com/api',
    store: true,
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


## Project Created & Maintained By

### [![Mohamed Sayed](./logo.png)](https://msayed.net)

Software Engineer | In :heart: with Flutter

# Donate

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - [PayPal](https://www.paypal.me/msayednet/)

## Note : All Contibutions Are Welcomed