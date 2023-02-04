// NOTE : This project didnt finish yet this is not the final result of it
class User {
  String id = '';
  String? jsonwebtoken; // the name is up to you
  final String FirstName;
  final String lastName;
  final String email;
  final String password;
  User({
    required this.id,
    this.jsonwebtoken,
    required this.FirstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'jsonwebtoke': jsonwebtoken,
        'FirstName': FirstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        jsonwebtoken: json['jsonwebtoken'],
        FirstName: json['FirstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
      );

/* static  String getToken(String token)  {
    final token2 = jsonwebtoken = token;
    return token2;
  }*/
}
