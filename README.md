# user_auth

Handy flutter plugin that help with user-backend-auth, written in pure dart code, in top of `http` and `shared_preferences`.

## usage
* import `package:user_auth/user_auth.dart`.
* create instance from `UserAuth`.
* init with `apiBaseUrl` and optional `store`: `true` | `false`, default is `false`, if `true` plugin will store user and retrieve with `loadUser()`.
* initialize plugin with `api_base_url`.

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


## Author
[![Mohamed Sayed](./logo.png)](https://msayed.net)
* [![LinkedIn](https://img.shields.io/badge/LinkedIn-in-0e76a8)](http://linkedin.msayed.net) &nbsp; [![Fork](https://img.shields.io/github/forks/MohamedSayed95/user_auth?style=social)](https://github.com/MohamedSayed95/user_auth/fork) &nbsp; [![Star](https://img.shields.io/github/stars/MohamedSayed95/user_auth?style=social)](https://github.com/MohamedSayed95/user_auth/stargazers) &nbsp; [![Watches](https://img.shields.io/github/watchers/MohamedSayed95/user_auth?style=social)](https://github.com/MohamedSayed95/user_auth/) 
* [![Plugin](https://img.shields.io/badge/Get%20library-pub-blue)](https://pub.dev/packages/user_auth) &nbsp; [![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/user_auth#-example-tab-)


## My Plugins
* [print_color](https://pub.dev/packages/print_color)
* [user_auth](https://pub.dev/packages/user_auth)
