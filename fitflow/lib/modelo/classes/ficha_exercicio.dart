import 'dart:convert';

class FichaExercicio {
  /*
  ficha_id     INT                   unique,
  exercicio_id INT                   unique, 
  dias_semana  ENUM('seg','ter','qua','qui','sex','sab','dom')
  */

  final int ficha_id;
  final int exercicio_id;
  final String dias_semana;

  FichaExercicio({
    required this.ficha_id,
    required this.exercicio_id,
    required this.dias_semana,
  });

  Map<String, dynamic> toMap() {
    return {
      'ficha_id': ficha_id,
      'exercicio_id': exercicio_id,
      'dias_semana': dias_semana,
    };
  }

  factory FichaExercicio.fromMap(Map<String, dynamic> map) {
    return FichaExercicio(
      ficha_id: map['ficha_id'] ?? 0,
      exercicio_id: map['exercicio_id'] ?? 0,
      dias_semana: map['dias_semana'] ?? '',
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
