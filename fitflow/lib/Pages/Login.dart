import 'package:fitflow/Pages/Cadastro.dart';
import 'package:fitflow/Pages/HelpSenhaView.dart';
import 'package:fitflow/Splashes/Splash2.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';
import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoLogin.dart';
import 'package:fitflow/controle/authController.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void erroShowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: Text('Usuario ou senha incorretos!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 225),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: Icon(Icons.person_outline),
                  placeHolder: 'Nome do usuário ou email',
                  eSenha: false,
                  texto: nomeController,
                  numerico: false,
                ),
                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: Icon(Icons.lock_outline),
                  placeHolder: 'Senha',
                  eSenha: true,
                  texto: senhaController,
                  numerico: false,
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    if (nomeController.text.isEmpty ||
                        senhaController.text.isEmpty) {
                      erroShowDialog();
                    } else {
                      User? usuario = await Authcontroller.login(
                        nomeController.text,
                        nomeController.text,
                        senhaController.text,
                      );

                      if (usuario != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Splash2(5, usuario),
                          ),
                        );
                      } else {
                        erroShowDialog();
                      }
                    }
                  },
                  child: AbsorbPointer(
                    child: ContainersWelcome(
                      cor: Color(0xFF5C65C0),
                      altura: 60,
                      comprimento: 330,
                      texto: 'Realizar login',
                      radius: 15,
                      notOnlyDecoracao: false,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                ContainersWelcome(
                  cor: Color(0xFF1C0B2B),
                  altura: 40,
                  comprimento: 330,
                  texto: 'Criar uma conta',
                  url: '',
                  webOrMob: false,
                  radius: 0,
                  classe: Cadastro(),
                  splash: false,
                  segs: 0,
                  volta: true,
                  saiApp: false,
                  notOnlyDecoracao: true,
                ),
                ContainersWelcome(
                  cor: Colors.transparent,
                  altura: 40,
                  comprimento: 330,
                  texto: "Esqueci minha senha",
                  url: '',
                  webOrMob: false,
                  radius: 0,
                  classe: Helpsenhaview(),
                  splash: false,
                  segs: 0,
                  volta: true,
                  saiApp: false,
                  notOnlyDecoracao: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
