# user_auth

Handy flutter plugin that help with user-backend-auth, written in pure dart code, in top of `http` package.

## usage
* import `package:user_auth/user_auth.dart`.
* create instance from `UserAuth`.
* initialize plugin with `api_base_url`, `username_parameter`, `password`.

## methods
##### you may change routes to fit your API
* `login` : default route `/user/login`, waits for `user` in response to return. 
* `check` : default route `/user/details`, waits for `user` in response to return.  
* `logout` : default route `/user/details`, return `true` | `false`.

## example
```dart
import 'package:user_auth/user_auth.dart';

// instance
UserAuth user = new UserAuth();

// init
await user.init(
    apiBaseUrl: 'https://mazeg.adortyyy.com/api/',
    userNameParam: 'email',
    passwordParam: 'password',
  );

// login
var activeUser = await user.login(
                    username: 'vendor@test.com',
                    password: '123456',
                  );

// check
var checkedUser = await user.check(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  ); // change 'Bearer ' and api_token with your own parameter

// check
var logout = await user.logout('Bearer ', activeUser['api_token']); 
```

## change log
plugin still in the early development stage
* added methods : `login` `logout` `check`
