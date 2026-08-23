import 'dart:convert';

import 'package:fitflow/modelo/classes/ficha.dart';

//import 'package:fitflow/modelo/local_storage_service.dart';

class Fichacontroller {
  static Future<List<Ficha>> listarFichas(String? recurso, bool ordem) async {
    String guardadoNoSever = '''
    {
      "fichas": [
        {
          "id": 101,
          "name": "Treino A - Hipertrofiaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "data_inicio": "2026-01-10",
          "data_fim": "2026-03-10",
          "descricao": "Foco em membros superioresaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        },
        {
          "id": 102,
          "name": "Treino B - Resistênciaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "data_inicio": "2026-01-12",
          "data_fim": "2026-01-15",
          "descricao": "Exercícios conjugados sem pressa"
        },
        {
          "id": 103,
          "name": "Tro",
          "data_inicio": "2026-06-01",
          "data_fim": "2026-07-01",
          "descricao": null
        }
      ]
    }
    ''';

    try {
      Map<String, dynamic> dadosDecodificados = json.decode(guardadoNoSever);

      List<dynamic> listaDeFichasBrutas = dadosDecodificados['fichas'];

      if (recurso != null && recurso.trim().isNotEmpty) {
        List<Ficha> fichasProntas = listaDeFichasBrutas.map((mapaDaFicha) {
          return Ficha.fromMap(mapaDaFicha);
        }).toList();

        List<Ficha> resultados = fichasProntas
            .where(
              (ficha) =>
                  ficha.name.toLowerCase().contains(recurso.toLowerCase()),
            )
            .toList();

        resultados.sort(
          (a, b) => ordem ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
        );

        return resultados;
      } else {
        List<Ficha> fichasProntas = listaDeFichasBrutas.map((mapaDaFicha) {
          return Ficha.fromMap(mapaDaFicha);
        }).toList();

        fichasProntas.sort(
          (a, b) => ordem ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
        );

        return fichasProntas;
      }
    } catch (e) {
      return [];
    }
  }
}
