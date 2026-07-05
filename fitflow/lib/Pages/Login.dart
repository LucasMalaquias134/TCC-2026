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

  final _formKey = GlobalKey<FormState>();

  void dispose() {
    nomeController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void erroShowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: Text('Usuario ou senha incorretos'),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Nome do usuário ou email',
                        controller: nomeController,
                        icone: Icons.person_outline,
                        validador: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, preencha este campo';
                          }
                          if (value.length < 3) {
                            return 'O nome precisa ter pelo menos 3 letras';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Senha',
                        controller: senhaController,
                        eSenha: true,
                        icone: Icons.lock_outline,
                        validador: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, preencha este campo';
                          }
                          if (value.length < 6) {
                            return 'A senha precisa ter pelo menos 6 digitos';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            User? usuario = await Authcontroller.login(
                              nomeController.text,
                              nomeController.text,
                              senhaController.text,
                            );

                            if (usuario != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Splash2(3, usuario),
                                ),
                              );
                            } else {
                              erroShowDialog();
                            }
                          }
                        },
                        child: AbsorbPointer(
                          child: ContainersWelcome(
                            cor: Color(0xFF6C63FF),
                            altura: 45,
                            comprimento: 330,
                            texto: 'Realizar login',
                            radius: 10,
                            notOnlyDecoracao: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                ContainersWelcome(
                  cor: Colors.transparent,
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
