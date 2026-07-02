import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';

class Usercontroller {
  //================================================================================
  static Future<bool> atualizarUsuario(
    int id,
    String name,
    String userName,
    int? idade,
    String? cidade,
  ) async {
    try {
      List<User> usuariosExistentes =
          await LocalStorageService.carregarUsuarios();

      int index = usuariosExistentes.indexWhere((usuario) => usuario.id == id);
      if (index == -1) return false;

      User usuario = usuariosExistentes[index];

      if (name.trim().isEmpty) return false;
      usuario.name = name;

      if (userName.trim().isEmpty) return false;

      bool userNameJaExiste = usuariosExistentes.any(
        (usuario) =>
            usuario.user_name.trim() == userName.trim() && usuario.id != id,
      );
      if (userNameJaExiste) return false;

      usuario.user_name = userName;

      usuario.idade = idade;

      usuario.cidadeMora = cidade;

      usuariosExistentes[index] = usuario;
      await LocalStorageService.salvarUsuarios(usuariosExistentes);
      return true;
    } catch (e) {
      print("Erro ao atualizar usuário: $e");
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
