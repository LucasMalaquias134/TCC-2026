import 'dart:convert';

import 'package:fitflow/modelo/classes/exercicio.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String LISTA_USERS = 'lista_users';
  static const String LISTA_EXERCICIOS = 'lista_exercicios';
  static const String LISTA_FICHA = 'lista_fichas';
  static const String LISTA_FICHA_EXERCICIOS = 'lista_fichas_exercicios';

  //===Recurso do usuario==========================================================================
  static Future<void> salvarUsuario(User usuario) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = json.encode(usuario.toMap());
    await prefs.setString(LISTA_USERS, encodedData);
  }

  static Future<User?> carregarUsuario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? usuariosJson = prefs.getString(LISTA_USERS);

    if (usuariosJson == null) return null;

    return User.fromMap(json.decode(usuariosJson));
  }

  static Future<void> deslogarUsuario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LISTA_USERS);
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
