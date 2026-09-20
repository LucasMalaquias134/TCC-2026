import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/local_storage_service.dart';

class Fichacontroller {
  static Future<List<Ficha>> listarFichas(String? recurso, bool ordem) async {
    List<Ficha> fichasProntas = await LocalStorageService.carregarFichas();

    try {
      if (recurso != null && recurso.trim().isNotEmpty) {
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
        fichasProntas.sort(
          (a, b) => ordem ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
        );

        return fichasProntas;
      }
    } catch (e) {
      return [];
    }
  }

  static Future<bool> guardarFicha(List<Ficha> ficha) async {
    try {
      await LocalStorageService.salvarFichas(ficha);

      return true;
    } catch (e) {
      print('Erro aqui no fichaController ( guardar ficha ) $e');
      return false;
    }
  }
}
