import 'dart:convert';
import 'package:fitflow/controle/authController.dart';
import 'package:fitflow/modelo/api/rotas.dart';
import 'package:fitflow/modelo/classes/token.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:http/http.dart' as http;

class Usersapi {
  static Future<int> atualizaDados(String token) async {
    final url = Uri.parse('${Rotas.rotaApi}me');

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
        final userData = jsonDecode(response.body);
        User usuario = User.fromMap(userData['data']);

        String? novoCaminho = await Authcontroller.baixarESalvarImagem(
          usuario.urlImage,
        );
        usuario.urlImage = novoCaminho;

        await Authcontroller.cadastrarNovoUsuario(usuario);

        //print('Dados do usuário: ${userData['data']}');
        //print('Nome: ${userData['data']['name']}');
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

  static Future<int> login(String email, String senha) async {
    String caminho = '${Rotas.rotaApi}login';
    final url = Uri.parse(caminho);

    try {
      final dadosEnviar = {'email': email, 'password': senha};

      final resposta = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dadosEnviar),
      );

      //print(resposta.body);

      if (resposta.statusCode == 200) {
        final Map<String, dynamic> respostaDecodificada = jsonDecode(
          resposta.body,
        );
        //print(respostaDecodificada);

        User usuario = User.fromMap(respostaDecodificada['user']);
        Token token = Token(token: respostaDecodificada['token']);

        String? novoCaminho = await Authcontroller.baixarESalvarImagem(
          usuario.urlImage,
        );
        usuario.urlImage = novoCaminho;

        await LocalStorageService.salvarToken(token);
        await Authcontroller.cadastrarNovoUsuario(usuario);
        return 200;
      } else if (jsonDecode(resposta.body).containsKey('eAdmin') &&
          jsonDecode(resposta.body)['eAdmin'] == true) {
        return 1;
      } else {
        print(
          'Erro no servidor: ${resposta.body} (Código: ${resposta.statusCode})',
        );
        return resposta.statusCode;
      }
    } catch (e) {
      print('Deu erro: $e');
      return 0;
    }
  }

  static Future<int> logout(String token) async {
    String caminho = '${Rotas.rotaApi}logout';
    final url = Uri.parse(caminho);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 204) {
      try {
        await Authcontroller.deslogarUsuario();

        return 204;
      } catch (e) {
        print('Algum erro $e');
        return 0;
      }
    } else {
      print(
        'Erro no servidor: ${response.body} (Código: ${response.statusCode})',
      );
      return response.statusCode;
    }
  }

  /*static Future<int> verificaSessao(String token) async {
    String caminho = '${Rotas.rotaApi}me';
    final url = Uri.parse(caminho);

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return 200;
    } else {
      print(
        'Erro no servidor: ${response.body} (Código: ${response.statusCode})',
      );
      return response.statusCode;
    }
  }*/
}
