import 'app_state.dart';
import 'login_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    loginResponse: loginReducer(state.authState, action),
  );
}