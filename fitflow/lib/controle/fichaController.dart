import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/local_storage_service.dart';

class Fichacontroller {
  static Future<bool> criarFicha(
    int id,
    String nome,
    String? desc,
    String dataInicio,
    String datafim,
  ) async {
    List<Ficha> fichasExistentes = await LocalStorageService.carregarFichas();

    List campos = [nome, dataInicio, datafim];

    if (campos.any((campo) => campo.trim().isEmpty)) {
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
  }

  static Future<List<Ficha>> listarFichas(int id) async {
    List<Ficha> fichas = await LocalStorageService.carregarFichas();

    List<Ficha> fichasUser = fichas
        .where((element) => element.user_id == id)
        .toList();

    return fichasUser;
  }

  static Future<bool> deletarFichas(int id) async {
    try {
      List<Ficha> lista = await LocalStorageService.carregarFichas();

      lista.removeWhere((ficha) => ficha.id == id);

      await LocalStorageService.salvarFichas(lista);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> atualizarFichas(
    int id,
    String nome,
    String? desc,
    String dataInicio,
    String datafim,
  ) async {
    List<Ficha> fichasExistentes = await LocalStorageService.carregarFichas();

    List campos = [nome, dataInicio, datafim];

    if (campos.any((campo) => campo.trim().isEmpty)) {
      return false;
    }

    int index = fichasExistentes.indexWhere((ficha) => ficha.id == id);

    if (index == -1) {
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
  }
}
