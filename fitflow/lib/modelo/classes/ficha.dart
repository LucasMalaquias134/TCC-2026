import 'dart:convert';

class Ficha {
  /*
  id          INT                   unique, 
  user_id     INT                   unique
  name        VARCHAR       45,  
  data_inicio DATE, 
  data_fim    DATE, 
  descricao   VARCHAR       100     nullable 
  */

  final int id;
  final String name;
  final String? data_inicio;
  final String? data_fim;
  final String? descricao;

  Ficha({
    required this.id,
    required this.name,
    required this.data_inicio,
    required this.data_fim,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'data_inicio': data_inicio,
      'data_fim': data_fim,
      'descricao': descricao,
    };
  }

  factory Ficha.fromMap(Map<String, dynamic> map) {
    return Ficha(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      data_inicio: map['data_inicio'] ?? null,
      data_fim: map['data_fim'] ?? null,
      descricao: map['descricao'] ?? null,
    );
  }

  static String encode(List<Ficha> fichas) =>
      json.encode(fichas.map<Map<String, dynamic>>((p) => p.toMap()).toList());

  static List<Ficha> decode(String fichasJson) =>
      (json.decode(fichasJson) as List<dynamic>)
          .map<Ficha>((item) => Ficha.fromMap(item))
          .toList();
}
