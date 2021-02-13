class LoginResponse {
  final String token;

  LoginResponse({this.token});

  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json['idToken'];

  Map<String, dynamic> toJson() => {
        'token': token,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponse &&
          runtimeType == other.runtimeType &&
          token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() {
    return 'LoginResponse{'
        '\ntoken: $token';
  }
}