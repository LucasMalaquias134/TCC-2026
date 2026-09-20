import 'package:fitflow/modelo/classes/token.dart';
import 'package:fitflow/modelo/local_storage_service.dart';

class Tokencontroller {
  static Future<String?> stringTokenCarregado() async {
    Token? token = await LocalStorageService.carregarToken();
    String? tokenString = token != null ? token.token : null;
    return tokenString;
  }
}
