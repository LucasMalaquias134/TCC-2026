import 'dart:convert';

class User {
  /*
  id          INT                   unique, 
  name        VARCHAR       255,  
  email       VARCHAR       255     unique, 
  urlImage    VARCHAR       255     nullable, 
  password    VARCHAR       255, 
  token       VARCHAR       100     nullable, 
  idade       INT                   nullable, 
  cidadeMora  VARCHAR       100     nullable,
  user_name   VARCHAR       45      unique
  */

  final int id;
  String name;
  String email;
  String? urlImage;
  String password;
  String? token;
  int? idade;
  String? cidadeMora;
  String user_name;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.urlImage,
    required this.password,
    this.token,
    this.idade,
    this.cidadeMora,
    required this.user_name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'urlImage': urlImage,
      'password': password,
      'token': token,
      'idade': idade,
      'cidadeMora': cidadeMora,
      'user_name': user_name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      urlImage: map['urlImage'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      idade: map['idade'] ?? null,
      cidadeMora: map['cidadeMora'] ?? null,
      user_name: map['user_name'] ?? '',
    );
  }

  static String encode(List<User> usuarios) => json.encode(
    usuarios.map<Map<String, dynamic>>((p) => p.toMap()).toList(),
  );

  static List<User> decode(String usersJson) =>
      (json.decode(usersJson) as List<dynamic>)
          .map<User>((item) => User.fromMap(item))
          .toList();
}
