import 'dart:convert';
import 'package:fitflow/modelo/api/rotas.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:http/http.dart' as http;

class Usersapi {
  /*static Future<int> registerUser(
    String nome,
    String email,
    String senha,
  ) async {
    String caminho = '${Rotas.rotaApi}register';
    final url = Uri.parse(caminho);

    final dadosEnviar = {'name': nome, 'email': email, 'password': senha};

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(dadosEnviar),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);

      User usuario = User(
        id: responseData['user']['id'],
        name: responseData['user']['name'],
        email: responseData['user']['email'],
        token: responseData['access_token'],
      );

      await LocalStorageService.salvarUsuario(usuario);
      return 201;
    } else {
      print('Deu erro: ${response.body}');
      return 400;
    }
  }*/

  static Future<int> login(String email, String senha) async {
    String caminho = '${Rotas.rotaApi}login';
    final url = Uri.parse(caminho);

    try {
      final dadosEnviar = {'email': email, 'password': senha};

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dadosEnviar),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);

        User usuario = User(
          id: responseData['user']['id'],
          user_name: responseData['user']['user_name'],
          name: responseData['user']['name'],
          email: responseData['user']['email'],
          idade: responseData['user']['idade'] ?? null,
          cidadeMora: responseData['user']['cidadeMora'] ?? null,
          token: responseData['token'],
        );

        await LocalStorageService.salvarUsuario(usuario);
        return 200;
      } else {
        print(
          'Erro no servidor: ${response.body} (Código: ${response.statusCode})',
        );
        return response.statusCode;
      }
    } catch (e) {
      print('Deu erro: $e');
      return 0;
    }
  }

  static Future<int> logout(User usuario) async {
    String caminho = '${Rotas.rotaApi}logout';
    final url = Uri.parse(caminho);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${usuario.token}',
      },
    );

    if (response.statusCode == 204) {
      await LocalStorageService.deslogarUsuario();

      return 204;
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
