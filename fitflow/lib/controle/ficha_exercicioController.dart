import 'dart:convert';

import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
//import 'package:fitflow/modelo/local_storage_service.dart';

class FichaExerciciocontroller {
  static Future<List<FichaExercicio>> listarFichasExercicios(int id) async {
    String guardadoNoSever = '''
    {
      "ficha_exercicios": [
        {
          "ficha_id": 101,
          "exercicio_id": 501,
          "dias_semana": "Segunda"
        },
        {
          "ficha_id": 101,
          "exercicio_id": 502,
          "dias_semana": "Quarta"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 502,
          "dias_semana": "Segunda"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 507,
          "dias_semana": "Terça"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 503,
          "dias_semana": "Quarta"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 503,
          "dias_semana": "Quinta"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 507,
          "dias_semana": "Sexta"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 503,
          "dias_semana": "Sexta"
        },
        {
          "ficha_id": 102,
          "exercicio_id": 501,
          "dias_semana": "Sexta"
        }
      ]
    }
    ''';

    try {
      Map<String, dynamic> dadosDecodificados = json.decode(guardadoNoSever);
      List<dynamic> listaBruta = dadosDecodificados['ficha_exercicios'];

      List<FichaExercicio> fichaExercicio = listaBruta
          .map((item) => FichaExercicio.fromMap(item))
          .where((fichaExercicio) => fichaExercicio.ficha_id == id)
          .toList();

      return fichaExercicio;
    } catch (e) {
      return [];
    }

    /*List<FichaExercicio> fichasExercicio = await LocalStorageService.carregarFichasExercicios();

    return fichasExercicio;*/
  }
}
