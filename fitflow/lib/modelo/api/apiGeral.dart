import 'dart:convert';

import 'package:fitflow/controle/fichaController.dart';
import 'package:fitflow/controle/ficha_exercicioController.dart';
import 'package:fitflow/modelo/api/rotas.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
import 'package:http/http.dart' as http;

class Apigeral {
  static Future<int> atualizaInfo(String token, int id) async {
    final url = Uri.parse('${Rotas.rotaApi}pegaDados/$id');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final dadosDecod = jsonDecode(response.body);
        //print(dadosDecod['fichaExercicio']);

        String fichasString = jsonEncode(dadosDecod['fichas']);
        String fichaExerciciosString = jsonEncode(dadosDecod['fichaExercicio']);

        List<Ficha> fichas = Ficha.decode(fichasString);
        List<FichaExercicio> fichaExercicios = FichaExercicio.decode(
          fichaExerciciosString,
        );

        bool resultadoFicha = await Fichacontroller.guardarFicha(fichas);
        bool resultadoFichaExercicio =
            await FichaExerciciocontroller.guardarFichaExercicio(
              fichaExercicios,
            );

        if (resultadoFichaExercicio == false || resultadoFicha == false) {
          print('Ue deu erro aqui apiGeral.atualizaInfo linha 55');
          return 0;
        }

        return 200;
      } else if (response.statusCode == 401) {
        print('Não autorizado: Token inválido ou expirado.');
        return 401;
      } else {
        print('Erro na requisição: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Erro de conexão: $e');
      return 0;
    }
  }
}
