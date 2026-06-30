import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';

class Usercontroller {
  //================================================================================
  static Future<bool> atualizarNome(String name, int id) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);

    if (index != -1 && !(name.trim().isEmpty)) {
      usuariosExistentes[id].name = name;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } else {
      return false;
    }
  }

  //================================================================================
  static Future<bool> atualizarUserName(String userName, int id) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);

    if (index != -1 &&
        !(usuariosExistentes.any((usuario) => usuario.user_name == userName)) &&
        !(userName.trim().isEmpty)) {
      usuariosExistentes[id].user_name = userName;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } else {
      return false;
    }
  }

  //================================================================================
  static Future<bool> atualizarEmail(String email, int id) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);

    if (index != -1 &&
        !(usuariosExistentes.any((usuario) => usuario.email == email)) &&
        !(email.trim().isEmpty)) {
      usuariosExistentes[id].email = email;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } else {
      return false;
    }
  }

  //================================================================================
  static Future<bool> atualizarIdade(int? idade, int id) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);

    if (index != -1) {
      usuariosExistentes[id].idade = idade;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } else {
      return false;
    }
  }

  //================================================================================
  static Future<bool> atualizarCidade(String? cidade, int id) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);

    if (index != -1) {
      usuariosExistentes[id].cidadeMora = cidade;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } else {
      return false;
    }
  }

  //================================================================================
  static Future<bool> atualizarImagem(String? urlImage, int id) async {
    List<User> usuariosExistentes =
        await LocalStorageService.carregarUsuarios();

    int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);

    if (index != -1) {
      usuariosExistentes[id].urlImage = urlImage;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } else {
      return false;
    }
  }
}
