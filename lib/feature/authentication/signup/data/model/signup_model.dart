class SignupModel {
  final int statusCode;
  final Body body;

  SignupModel({required this.statusCode, required this.body});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
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

  Body({required this.message});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
