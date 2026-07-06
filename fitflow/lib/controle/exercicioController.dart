import 'dart:convert';

import 'package:fitflow/modelo/classes/exercicio.dart';
import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
//import 'package:fitflow/modelo/local_storage_service.dart';

class Exerciciocontroller {
  static Future<List<Exercicio>> listarExercicios(
    FichaExercicio fichaExercicioModel,
  ) async {
    String guardadoNoSever = '''
    {
      "exercicios": [
    {
      "id": 501,
      "treino": "Supino Reto",
      "qntdSeries": 4,
      "qtndRep": 10,
      "peso": 25.5,
      "descanso": 60,
      "descricao": "Manter a barra alinhada com o mamilo"
    },
    {
      "id": 502,
      "treino": "Agachamento Livre",
      "qntdSeries": 4,
      "qtndRep": 12,
      "peso": 40.0,
      "descanso": 90,
      "descricao": "Descer até 90 graus"
    },
    {
      "id": 503,
      "treino": "Corrida Esteira",
      "qntdSeries": 1,
      "qtndRep": 1,
      "peso": null,
      "descanso": null,
      "descricao": "20 minutos mantendo BPM alto"
    },
    {
      "id": 507,
      "treino": "Maratona",
      "qntdSeries": 1,
      "qtndRep": 1,
      "peso": null,
      "descanso": null,
      "descricao": null
    }
  ]
    }
    ''';

    String guardadoNoSever2 = '''
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

    Map<String, dynamic> dadosDecodificados2 = json.decode(guardadoNoSever2);
    List<dynamic> listaBruta2 = dadosDecodificados2['ficha_exercicios'];

    List<FichaExercicio> fichaExercicioLista = listaBruta2
        .map((item) => FichaExercicio.fromMap(item))
        .where(
          (fichaExercicio) =>
              fichaExercicio.dias_semana == fichaExercicioModel.dias_semana &&
              fichaExercicio.ficha_id == fichaExercicioModel.ficha_id,
        )
        .toList();

    List<int> idsEncontrados = fichaExercicioLista
        .map((id) => id.exercicio_id)
        .toList();

    Map<String, dynamic> dadosDecodificados = json.decode(guardadoNoSever);
    List<dynamic> listaBruta = dadosDecodificados['exercicios'];

    List<Exercicio> exercicios = listaBruta
        .map((item) => Exercicio.fromMap(item))
        .where((element) => idsEncontrados.contains(element.id))
        .toList();
    return exercicios;
  }
}
