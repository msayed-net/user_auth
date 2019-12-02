# user_auth

Handy flutter plugin that help with user-backend-auth, written in pure dart code, in top of `http and shared_preferences` packages.

## usage
* import `package:user_auth/user_auth.dart`.
* create instance from `UserAuth`.
* init with `apiBaseUrl` and optional `store`: `true` | `false`, default is `false`, if `true` plugin will create local storage variable for user and retrieve it with `loadUser()`.
* initialize plugin with `api_base_url`, `username_parameter`, `password`.

## methods
##### you may change routes to fit your API
* `login` : default route `/user/login`, waits for `user` in response to return. 
* `check` : default route `/user/details`, waits for `user` in response to return.  
* `logout` : default route `/user/details`, return `true` | `false`.
* `loadUser` : local method, return `user` if stored.

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
                  ); // change 'Bearer ' and api_token with your own parameter

// logout
var logout = await user.logout(
                    type: 'Bearer ',
                    token: activeUser['api_token'],
                  );
```

## change log
plugin still in the early development stage
* added methods : `login` `logout` `check` `loadUser`
