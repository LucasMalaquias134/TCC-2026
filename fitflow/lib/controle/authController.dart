import 'dart:convert';

import 'package:fitflow/Pages/Home.dart';
import 'package:fitflow/Pages/Welcome.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:flutter/material.dart';
//import 'dart:math';

class Authcontroller {
  /*static String _gerarStringAleatoria() {
    const caracteres =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    final random = Random();

    return String.fromCharCodes(
      Iterable.generate(
        5,
        (_) => caracteres.codeUnitAt(random.nextInt(caracteres.length)),
      ),
    );
  }*/

  /*static Future<User?> cadastrarNovoUsuario(
    String name,
    String email,
    String? urlImage,
    String password,
    String confirmaPassword,
    int? idade,
    String? cidadeMora,
    String user_name,
  ) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    List campos = [name, email, password, confirmaPassword, user_name];

    if (campos.any((campo) => campo.trim().isEmpty)) {
      return null;
    }

    if (password != confirmaPassword) {
      return null;
    }

    bool emailJaExiste = usuariosExistentes.any((u) => u.email == email);
    if (emailJaExiste) return null;
    bool userNameJaExiste = usuariosExistentes.any(
      (u) => u.user_name == user_name,
    );
    if (userNameJaExiste) return null;

    User novoUser = User(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      email: email,
      urlImage: urlImage,
      password: password,
      token: _gerarStringAleatoria(),
      user_name: user_name,
      cidadeMora: cidadeMora,
      idade: idade,
    );

    usuariosExistentes.add(novoUser);
    await LocalStorageService.salvarUsuarios(usuariosExistentes);

    await LocalStorageService.salvarUsuarioLogado(novoUser.token!);

    return novoUser;
  }*/

  static Future<User?> login(
    String userName,
    String email,
    String password,
  ) async {
    String guardadoNoSever = '''
    {
      "user": {
        "id": 1,
        "name": "Lucas Gabriel",
        "email": "lucas@email.com",
        "urlImage": "",
        "password": "123456",
        "token": "token-gerado-pelo-servidor-123456",
        "idade": 21,
        "cidadeMora": "Formiga",
        "user_name": "lucas_fera"
      }
    }
    ''';

    try {
      Map<String, dynamic> dadosDecodificados = json.decode(guardadoNoSever);
      Map<String, dynamic> userMap = dadosDecodificados['user'];

      if ((userName == userMap['user_name'] || email == userMap['email']) &&
          password == userMap['password']) {
        User usuario = User(
          id: userMap['id'],
          name: userMap['name'],
          email: userMap['email'],
          urlImage: userMap['urlImage'],
          password: '',
          token: userMap['token'],
          idade: userMap['idade'],
          cidadeMora: userMap['cidadeMora'],
          user_name: userMap['user_name'],
        );

        await LocalStorageService.salvarUsuario(usuario);

        return usuario;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> deslogarUsuario() async {
    await LocalStorageService.deslogarUsuario();
  }

  static Future<void> verificaSessao(BuildContext context) async {
    User? usuarioAtivo = await LocalStorageService.carregarUsuario();

    if (usuarioAtivo != null) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(usuario: usuarioAtivo)),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      });
    }
  }
}
