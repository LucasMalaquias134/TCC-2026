import 'dart:convert';

class FichaExercicio {
  final int id;
  final String treino;
  final int ficha_id;
  final int exercicio_id;
  final String dias_semana;
  final int ordem;
  final int? qntdSeries;
  final int? qntdRep;
  final String? peso;
  final int? descanso;
  final String? descricao;

  FichaExercicio({
    required this.id,
    required this.treino,
    required this.ficha_id,
    required this.exercicio_id,
    required this.dias_semana,
    required this.ordem,
    this.qntdSeries,
    this.qntdRep,
    this.peso,
    this.descanso,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'treino': treino,
      'ficha_id': ficha_id,
      'exercicio_id': exercicio_id,
      'dias_semana': dias_semana,
      'ordem': ordem,
      'qntdSeries': qntdSeries,
      'qtndRep': qntdRep,
      'peso': peso,
      'descanso': descanso,
      'descricao': descricao,
    };
  }

  factory FichaExercicio.fromMap(Map<String, dynamic> map) {
    return FichaExercicio(
      id: map['id'] ?? 0,
      treino: map['treino'] ?? '',
      ficha_id: map['ficha_id'] ?? 0,
      exercicio_id: map['exercicio_id'] ?? 0,
      dias_semana: map['dias_semana'] ?? '',
      ordem: map['ordem'] ?? 0,
      qntdSeries: map['qntdSeries'] ?? 0,
      qntdRep: map['qntdRep'] ?? 0,
      peso: map['peso'] ?? null,
      descanso: map['descanso'] ?? null,
      descricao: map['descricao'] ?? null,
    );
  }

  static String encode(List<FichaExercicio> fichasExercicio) => json.encode(
    fichasExercicio.map<Map<String, dynamic>>((p) => p.toMap()).toList(),
  );

  static List<FichaExercicio> decode(String fichaExerciciosJson) =>
      (json.decode(fichaExerciciosJson) as List<dynamic>)
          .map<FichaExercicio>((item) => FichaExercicio.fromMap(item))
          .toList();
}
