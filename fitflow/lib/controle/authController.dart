import 'package:fitflow/Pages/Welcome.dart';
import 'package:fitflow/Splashes/Splash2.dart';
import 'package:fitflow/modelo/classes/token.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class Authcontroller {
  static Future<String?> baixarESalvarImagem(String? urlImagem) async {
    if (urlImagem != null && urlImagem.trim().isNotEmpty) {
      //print('Toa aquiiiiiiii : $urlImagem');
      try {
        final response = await http.get(Uri.parse(urlImagem));

        if (response.statusCode != 200) {
          return null;
        }

        final appDir = await getApplicationDocumentsDirectory();

        String nomeArquivo = path.basename(urlImagem);

        File arquivoLocal = File('${appDir.path}/$nomeArquivo');

        await arquivoLocal.writeAsBytes(response.bodyBytes);

        //print('${arquivoLocal.existsSync()} aqui estaaaa');
        return arquivoLocal.path;
      } catch (e) {
        print("Erro aqui oooo: $e");
        return null;
      }
    } else {
      //print('agora eu to aqui mkkkk');
      return null;
    }
  }

  static Future<void> cadastrarNovoUsuario(User usuario) async {
    User? usuariosExistentes = await LocalStorageService.carregarUsuario();

    if (usuariosExistentes != null) {
      await LocalStorageService.deslogarUsuario();
      await LocalStorageService.salvarUsuario(usuario);
    } else {
      await LocalStorageService.salvarUsuario(usuario);
    }
  }

  static Future<void> deslogarUsuario() async {
    await LocalStorageService.deslogarUsuario();
    await LocalStorageService.deslogarToken();
  }

  static Future<void> verificaSessao(BuildContext context) async {
    User? usuarioAtivo = await LocalStorageService.carregarUsuario();
    Token? token = await LocalStorageService.carregarToken();

    if (usuarioAtivo != null && token != null) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash2()),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      });
    }
  }
}
