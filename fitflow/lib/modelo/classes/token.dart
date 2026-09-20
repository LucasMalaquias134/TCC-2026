import 'dart:convert';

class Token {
  final String token;

  Token({required this.token});

  Map<String, dynamic> toMap() {
    return {'token': token};
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(token: map['token'] ?? '');
  }

  static String encode(List<Token> token) =>
      json.encode(token.map<Map<String, dynamic>>((p) => p.toMap()).toList());

  static List<Token> decode(String tokensJson) =>
      (json.decode(tokensJson) as List<dynamic>)
          .map<Token>((item) => Token.fromMap(item))
          .toList();
}
