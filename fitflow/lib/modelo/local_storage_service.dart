import 'package:fitflow/modelo/classes/exercicio.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String LISTA_USERS = 'lista_users';
  static const String sharedPref_token = 'sharedPref_token';
  static const String LISTA_EXERCICIOS = 'lista_exercicios';
  static const String LISTA_FICHA = 'lista_fichas';
  static const String LISTA_FICHA_EXERCICIOS = 'lista_fichas_exercicios';

  //===Recurso do usuario==========================================================================
  static Future<void> salvarUsuarios(List<User> lista) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = User.encode(lista);
    await prefs.setString(LISTA_USERS, encodedData);
  }

  static Future<List<User>> carregarUsuarios() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? usuariosJson = prefs.getString(LISTA_USERS);

    if (usuariosJson == null) return [];

    return User.decode(usuariosJson);
  }

  //===Recurso de autenticação==========================================================================
  static Future<void> salvarUsuarioLogado(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPref_token, token);
  }

  static Future<User?> obterUsuarioLogado() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? tokenlLogado = prefs.getString(sharedPref_token);

    if (tokenlLogado == null) return null;

    List<User> todosOsUsers = await carregarUsuarios();

    try {
      return todosOsUsers.firstWhere((User) => User.token == tokenlLogado);
    } catch (e) {
      return null;
    }
  }

  static Future<void> deslogarUsuario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(sharedPref_token);
  }

  //===Recurso do exercicio==========================================================================
  static Future<void> salvarExercicios(List<Exercicio> lista) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = Exercicio.encode(lista);
    await prefs.setString(LISTA_EXERCICIOS, encodedData);
  }

  static Future<List<Exercicio>> carregarExercicios() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? exercicioJson = prefs.getString(LISTA_EXERCICIOS);

    if (exercicioJson == null) return [];

    return Exercicio.decode(exercicioJson);
  }

  //===Recurso de fichas==========================================================================
  static Future<void> salvarFichas(List<Ficha> lista) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = Ficha.encode(lista);
    await prefs.setString(LISTA_FICHA, encodedData);
  }

  static Future<List<Ficha>> carregarFichas() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fichaJson = prefs.getString(LISTA_FICHA);

    if (fichaJson == null) return [];

    return Ficha.decode(fichaJson);
  }

  //===Recurso de fichas_exercicio==========================================================================
  static Future<void> salvarFichasExercicios(List<FichaExercicio> lista) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = FichaExercicio.encode(lista);
    await prefs.setString(LISTA_FICHA_EXERCICIOS, encodedData);
  }

  static Future<List<FichaExercicio>> carregarFichasExercicios() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fichaExercicioJson = prefs.getString(LISTA_FICHA_EXERCICIOS);

    if (fichaExercicioJson == null) return [];

    return FichaExercicio.decode(fichaExercicioJson);
  }
}
