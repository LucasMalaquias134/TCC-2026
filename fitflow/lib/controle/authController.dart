import 'package:fitflow/Pages/Home.dart';
import 'package:fitflow/Pages/Welcome.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Authcontroller {
  static String _gerarStringAleatoria() {
    const caracteres =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    final random = Random();

    return String.fromCharCodes(
      Iterable.generate(
        5,
        (_) => caracteres.codeUnitAt(random.nextInt(caracteres.length)),
      ),
    );
  }

  static Future<User?> cadastrarNovoUsuario(
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
  }

  static Future<User?> login(
    String userName,
    String email,
    String password,
  ) async {
    List<User> usuariosSalvos = await LocalStorageService.carregarUsuarios();

    try {
      User usuarioEncontrado = usuariosSalvos.firstWhere(
        (user) =>
            (user.email == email || user.user_name == userName) &&
            user.password == password,
      );

      usuarioEncontrado.token = _gerarStringAleatoria();

      int id = usuariosSalvos.indexWhere(
        (user) => user.id == usuarioEncontrado.id,
      );

      if (id != -1) {
        usuariosSalvos[id] = usuarioEncontrado;
        await LocalStorageService.salvarUsuarios(usuariosSalvos);
      }

      await LocalStorageService.salvarUsuarioLogado(usuarioEncontrado.token!);

      return usuarioEncontrado;
    } catch (e) {
      return null;
    }
  }

  static Future<void> deslogarUsuario() async {
    await LocalStorageService.deslogarUsuario();
  }

  static Future<void> verificaSessao(BuildContext context) async {
    User? usuarioAtivo = await LocalStorageService.obterUsuarioLogado();

    if (usuarioAtivo != null) {
      Future.delayed(Duration(seconds: 10), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(usuario: usuarioAtivo)),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 10), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      });
    }
  }
}
