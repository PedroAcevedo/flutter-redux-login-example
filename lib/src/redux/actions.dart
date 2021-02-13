import 'package:redux_login/src/models/login_response.dart';

class LoginResponseAction {
  final LoginResponse _loginResponse;

  LoginResponseAction({loginResponse}) : this._loginResponse = loginResponse;

  LoginResponse get loginResponse => _loginResponse;

  @override
  String toString() {
    return 'LoginResponseAction{_loginResponse: $_loginResponse}';
  }
}