import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_login/src/models/login_response.dart';
import 'package:redux_login/src/providers/user_provider.dart';
import 'package:redux_login/src/redux/actions.dart';
import 'package:redux_login/src/redux/app_state.dart';
import 'package:redux_login/src/utils/constants.dart';

typedef OnLoginResponseCallback = void Function(LoginResponse loginResponse);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final user = UserProvider();

  String email;
  String password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnLoginResponseCallback>(
      converter: (Store<AppState> store) {
        return (data) {
          store.dispatch(LoginResponseAction(loginResponse: data));
        };
      },
      builder:
          (BuildContext context, OnLoginResponseCallback loginResponseSave) {
       return SafeArea(
          child: Container(
              child: Column(
            children: [
              SizedBox(height: 200.0),
              Container(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/secure.png'),
                    height: 120.0,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _emailField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _passwordField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _submitButtom(context, loginResponseSave)
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          initialValue: password,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a password';
            } else if (value.length < 3) {
              return 'The password is too short';
            }
            return null;
          },
        ));
  }

  Widget _emailField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          initialValue: email,
          decoration: InputDecoration(
            hintText: 'example@gmail.con',
            labelText: 'Email address',
          ),
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter an email address';
            } else if (!emailRegex.hasMatch(value)) {
              return 'Invalid email address!';
            }
            return null;
          },
        ));
  }

  Widget _submitButtom(
      BuildContext context, OnLoginResponseCallback loginResponseSave) {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 25.0),
          child: isLoading == true
              ? CircularProgressIndicator()
              : Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
        ),
        color: Colors.red,
        onPressed: () {
          if (!_formKey.currentState.validate()) return;
          try {
            _loginHandler(loginResponseSave);
          } catch (e) {
            print("Error $e");
          }
        });
  }

  _loginHandler(OnLoginResponseCallback loginResponseCallback) async {
    setState(() {
      isLoading = true;
    });

    LoginResponse loginResponse =
        LoginResponse.fromJson(await user.login(email, password));

    setState(() {
      isLoading = false;
    });
    loginResponseCallback(loginResponse);

    return loginResponse;
  }
}
