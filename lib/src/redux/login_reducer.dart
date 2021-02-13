import 'package:redux/redux.dart';
import 'package:redux_login/src/models/login_response.dart';
import 'actions.dart';

final loginReducer = combineReducers<LoginResponse>([
  TypedReducer<LoginResponse, LoginResponseAction>(_setLoginResponseData),
]);

LoginResponse _setLoginResponseData(
    LoginResponse state, LoginResponseAction action) {
  return LoginResponse(
    token: action.loginResponse.token,
  );
}