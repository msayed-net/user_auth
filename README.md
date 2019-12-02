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

// register
Map form = {
                    "email" : "test@test.com",
                    "phone" : "00000000",
                    "name" : "mohamed sayed",
                    "password" : "1234567",
                  };
                  registeredUser = await user.register(form: form);
```

## change log
### v1.0.0
* methods : `login` `logout` `check` `loadUser`.
* stores data into android:`prefs` | iOS:`defaults`.
### v1.1.0
* new methods : `register`
* performance optimization