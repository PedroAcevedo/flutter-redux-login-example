import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_login/src/pages/login_page.dart';
import 'package:redux_login/src/pages/main_page.dart';
import 'package:redux_login/src/redux/app_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
        converter: (store) => store.state.authState.token,
        builder: (BuildContext context, token) {
          return Scaffold(
            appBar: AppBar(
              title: Text(token == null ? 'Login form' : 'Main content'),
              backgroundColor: Colors.red,
            ),
            body: token == null ? LoginPage() : MainPage(),
          );
        });
  }
}
