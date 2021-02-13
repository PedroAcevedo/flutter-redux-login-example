import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {

  final String _firebaseToken = 'AIzaSyBIENmBW-xipU7SeZK62CFirOSCs9L2G5w';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    print(authData);

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));

    print(resp.body);
    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    return decodedResp;

  }
}
