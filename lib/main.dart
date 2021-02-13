import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_login/src/models/login_response.dart';
import 'package:redux_login/src/pages/home_page.dart';
import 'package:redux_login/src/redux/app_reducer.dart';
import 'package:redux_login/src/redux/app_state.dart';

void main() =>
  runApp(MyApp(
     store: Store<AppState>(
      appReducer,
      initialState: AppState(
        loginResponse: LoginResponse(
          token: null,
        ),
      ),
    ),
  ));


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Store<AppState> _store;

  const MyApp({
    Key key,
    @required store,
  })  : this._store = store,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
          title: 'Redux Login example',
          routes: {
            '/': (BuildContext context) => HomePage(),
          }),
    );
  }
}
