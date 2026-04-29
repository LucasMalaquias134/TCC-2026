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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C0B2B),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF1C0B2B),
      body: Center(
        child: Column(
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
              'assets/img/userProfile.png',
              40,
              330,
              'Nome do usuário ou telefone ou email',
              false,
              true,
            ),
            SizedBox(height: 20),
            Textfieldsdologin(
              'assets/img/senhaIcone.png',
              40,
              330,
              'Senha',
              true,
              true,
            ),
            SizedBox(height: 30),
            WelcomeContainers(
              Color(0xFF5C65C0),
              40,
              330,
              'Realizar login',
              '',
              false,
              0,
              Home(),
              true,
              5,
              false,
              false,
            ),
            SizedBox(height: 14),
            WelcomeContainers(
              Color(0xFF1C0B2B),
              40,
              330,
              'Criar uma conta',
              'http://127.0.0.1:8000/',
              true,
              0,
              Login(),
              false,
              0,
              true,
              false,
            ),
            WelcomeContainers(
              Colors.transparent,
              40,
              330,
              "Esqueci minha senha",
              'http://127.0.0.1:8000/',
              true,
              0,
              Login(),
              false,
              0,
              true,
              false,
            ),
          ],
        ),
      ),
    );
  }
}
