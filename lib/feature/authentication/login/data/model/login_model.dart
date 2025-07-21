class LoginModel {
  final int statusCode;
  final Body body;

  LoginModel({required this.statusCode, required this.body});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      statusCode: json['statusCode'],
      body: Body.fromJson(json['body']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': body.toJson(),
    };
  }
}

class Body {
  final String message;
  final String token;

  Body({required this.message, required this.token});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      message: json['message'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
    };
  }
}
