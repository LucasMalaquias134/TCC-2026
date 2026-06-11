import 'package:fitflow/Pages/Cadastro.dart';
import 'package:fitflow/Pages/HelpSenhaView.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';
import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoLogin.dart';
import 'package:flutter/material.dart';
import 'package:fitflow/Pages/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C0B2B),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF1C0B2B),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/img/LogoMaisSombreada.png'),
                  width: 250,
                  height: 145,
                ),
                SizedBox(height: 80),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: Icon(Icons.person_outline),
                  placeHolder: 'Nome do usuário ou telefone ou email',
                  eSenha: false,
                  texto: nomeController,
                ),
                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: Icon(Icons.lock_outline),
                  placeHolder: 'Senha',
                  eSenha: true,
                  texto: senhaController,
                ),
                SizedBox(height: 40),
                ContainersWelcome(
                  Color(0xFF5C65C0),
                  60,
                  330,
                  'Realizar login',
                  '',
                  false,
                  15,
                  Home(),
                  true,
                  5,
                  false,
                  false,
                ),
                SizedBox(height: 14),
                ContainersWelcome(
                  Color(0xFF1C0B2B),
                  40,
                  330,
                  'Criar uma conta',
                  '',
                  false,
                  0,
                  Cadastro(),
                  false,
                  0,
                  true,
                  false,
                ),
                ContainersWelcome(
                  Colors.transparent,
                  40,
                  330,
                  "Esqueci minha senha",
                  '',
                  false,
                  0,
                  Helpsenhaview(),
                  false,
                  0,
                  true,
                  false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
