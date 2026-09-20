import 'package:fitflow/Pages/Cadastro.dart';
import 'package:fitflow/Splashes/Splash2.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';
import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoLogin.dart';
import 'package:fitflow/modelo/api/usersApi.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void barraDeSucesso(String texto) {
    SnackBar minhaSnack = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 6),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(minhaSnack);
  }

  void barraDeFracasso(String texto) {
    SnackBar minhaSnack = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 6),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(minhaSnack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF130D26),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF130D26),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Textfieldsdologin(
                          largura: 330,
                          placeHolder: 'Seu Email',
                          controller: emailController,
                          icone: Icons.mail_outline,
                          validador: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            if (value.length < 3) {
                              return 'O email precisa ter pelo menos 3 caracteres';
                            }
                            if (!value.contains('@')) {
                              return 'O email precisa ser válido';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Textfieldsdologin(
                          largura: 330,
                          placeHolder: 'Sua Senha',
                          controller: senhaController,
                          eSenha: true,
                          icone: Icons.lock_outline,
                          validador: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            if (value.length < 8) {
                              return 'A senha precisa ter pelo menos 8 digitos';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              int resultado = await Usersapi.login(
                                emailController.text,
                                senhaController.text,
                              );

                              if (resultado == 200) {
                                barraDeSucesso('Login realizado Com Sucesso!');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Splash2(),
                                  ),
                                );
                              } else if (resultado == 401) {
                                barraDeFracasso('Senha ou Email incorretos!');
                              } else if (resultado == 0) {
                                //print(resultado);
                                barraDeFracasso(
                                  'Sem conexão, tente novamente mais tarde',
                                );
                              } else if (resultado == 1) {
                                //print(resultado);
                                barraDeFracasso(
                                  'Acesso negado para Administradores',
                                );
                              } else if (resultado == 403) {
                                //print(resultado);
                                barraDeFracasso(
                                  'Precisa fazer a verificação de seu email, tente novamente mais tarde',
                                );
                              } else {
                                //print(resultado);
                                barraDeFracasso(
                                  'Algo deu Errado Tente Novamente',
                                );
                              }
                            }
                          },
                          child: AbsorbPointer(
                            child: ContainersWelcome(
                              cor: Color(0xFF6E5CFF),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
