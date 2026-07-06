import 'dart:convert';

class Exercicio {
  /*
  id          INT                   unique, 
  treino      VARCHAR       45,  
  qntdSeries  INT, 
  qtndRep     INT, 
  peso        DECIMAL(6,2)          nullable, 
  descanso    INT,                  nullable
  descricao   VARCHAR       100     nullable,
  */

  final int id;
  final String treino;
  final int qntdSeries;
  final int qtndRep;
  final double? peso;
  final int? descanso;
  final String? descricao;

  Exercicio({
    required this.id,
    required this.treino,
    required this.qntdSeries,
    required this.qtndRep,
    this.peso,
    this.descanso,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'treino': treino,
      'qntdSeries': qntdSeries,
      'qtndRep': qtndRep,
      'peso': peso,
      'descanso': descanso,
      'descricao': descricao,
    };
  }

  factory Exercicio.fromMap(Map<String, dynamic> map) {
    return Exercicio(
      id: map['id'] ?? 0,
      treino: map['treino'] ?? '',
      qntdSeries: map['qntdSeries'] ?? 0,
      qtndRep: map['qtndRep'] ?? 0,
      peso: map['peso'] ?? null,
      descanso: map['descanso'] ?? null,
      descricao: map['descricao'] ?? null,
    );
  }

  static String encode(List<Exercicio> exercicio) => json.encode(
    exercicio.map<Map<String, dynamic>>((p) => p.toMap()).toList(),
  );

  static List<Exercicio> decode(String exerciciosJson) =>
      (json.decode(exerciciosJson) as List<dynamic>)
          .map<Exercicio>((item) => Exercicio.fromMap(item))
          .toList();
}
