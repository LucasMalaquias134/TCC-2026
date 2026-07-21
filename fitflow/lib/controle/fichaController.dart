import 'dart:convert';

import 'package:fitflow/modelo/classes/ficha.dart';
//import 'package:fitflow/modelo/local_storage_service.dart';

class Fichacontroller {
  /*static Future<bool> criarFicha(
    int id,
    String nome,
    String? desc,
    String? dataInicio,
    String? datafim,
  ) async {
    List<Ficha> fichasExistentes = await LocalStorageService.carregarFichas();

    if (nome.trim().isEmpty) {
      return false;
    }

    if ((dataInicio == null && datafim != null) ||
        (dataInicio != null && datafim == null)) {
      return false;
    }

    try {
      Ficha novaFicha = Ficha(
        id: DateTime.now().millisecondsSinceEpoch,
        user_id: id,
        name: nome,
        data_inicio: dataInicio,
        data_fim: datafim,
        descricao: desc,
      );

      fichasExistentes.add(novaFicha);
      await LocalStorageService.salvarFichas(fichasExistentes);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }*/

  static Future<List<Ficha>> listarFichas(String? recurso) async {
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
          "data_inicio": null,
          "data_fim": null,
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

        return resultados;
      } else {
        List<Ficha> fichasProntas = listaDeFichasBrutas.map((mapaDaFicha) {
          return Ficha.fromMap(mapaDaFicha);
        }).toList();

        return fichasProntas;
      }
    } catch (e) {
      return [];
    }

    /*List<Ficha> fichas = await LocalStorageService.carregarFichas();

    return fichas;*/
  }

  /*static Future<bool> deletarFichas(int id) async {
    try {
      List<Ficha> lista = await LocalStorageService.carregarFichas();

      lista.removeWhere((ficha) => ficha.id == id);

      await LocalStorageService.salvarFichas(lista);

      return true;
    } catch (e) {
      return false;
    }
  }*/

  /*static Future<bool> atualizarFichas(
    int id,
    String nome,
    String? desc,
    String? dataInicio,
    String? datafim,
  ) async {
    List<Ficha> fichasExistentes = await LocalStorageService.carregarFichas();

    if (nome.trim().isEmpty) {
      return false;
    }

    int index = fichasExistentes.indexWhere((ficha) => ficha.id == id);

    if (index == -1) {
      return false;
    }

    if ((dataInicio == null && datafim != null) ||
        (dataInicio != null && datafim == null)) {
      return false;
    }

    try {
      Ficha ficha = fichasExistentes[index];

      if (ficha.name != nome) {
        ficha.name = nome;
      }
      if (ficha.descricao != desc) {
        ficha.descricao = desc;
      }
      if (ficha.data_inicio != dataInicio) {
        ficha.data_inicio = dataInicio;
      }
      if (ficha.data_fim != datafim) {
        ficha.data_fim = datafim;
      }

      fichasExistentes[index] = ficha;
      await LocalStorageService.salvarFichas(fichasExistentes);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }*/
}
