import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
import 'package:fitflow/modelo/local_storage_service.dart';

//import 'package:fitflow/modelo/local_storage_service.dart';

class FichaExerciciocontroller {
  static Future<List<FichaExercicio>?> listarFichaExercicio(int id) async {
    try {
      List<FichaExercicio> listaDeFichaExercicio =
          await LocalStorageService.carregarFichasExercicios();

      List<FichaExercicio> listaOrdenada = listaDeFichaExercicio
          .where((element) => element.ficha_id == id)
          .toList();

      listaOrdenada.sort((a, b) => a.ordem.compareTo(b.ordem));

      return listaOrdenada;
    } catch (e) {
      print(
        'deu erro aqui no ficha_exercicioController.listarfichaexercicios : $e',
      );
      return [];
    }
  }

  static Future<bool> guardarFichaExercicio(
    List<FichaExercicio> fichaExercicios,
  ) async {
    try {
      await LocalStorageService.salvarFichasExercicios(fichaExercicios);

      return true;
    } catch (e) {
      print(
        'Erro aqui no fichaExercicioController ( guardar fichaExercicio ) $e',
      );
      return false;
    }
  }
}
