import 'dart:io';
import 'package:fitflow/Pages/Login.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';
import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoLogin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cidadeMoraController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    idadeController.dispose();
    cidadeMoraController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  File? arquivoDeImagem;

  final ImagePicker picker = ImagePicker();

  Future<void> selecionaImagen() async {
    final XFile? selectedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (selectedImage != null) {
      setState(() {
        arquivoDeImagem = File(selectedImage.path);
      });
    }
  }

  void erroShowDialog(bool qualErro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: qualErro
              ? Text('Ainda existe campos obrigatórios a serem preenchidos')
              : Text(
                  'As senhas não estão iguais ou esse email e nome de usuário já está cadastrado',
                ),
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
        backgroundColor: Color(0xFF130D26),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF130D26),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        child: Text(
                          'Crie sua conta em apenas algum passos!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 30,
                            fontWeight: FontWeight(200),
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          await selecionaImagen();
                        },
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          backgroundImage: arquivoDeImagem != null
                              ? FileImage(arquivoDeImagem!)
                              : null,
                          child: arquivoDeImagem == null
                              ? const Icon(
                                  Icons.person_outline,
                                  size: 80,
                                  color: Colors.black,
                                )
                              : null,
                        ),
                      ),

                      SizedBox(height: 20),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Seu nome',
                        controller: nameController,
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
                      SizedBox(height: 15),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Seu email',
                        controller: emailController,
                        icone: Icons.email_outlined,
                        validador: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, preencha este campo';
                          }
                          if (!value.contains('@')) {
                            return 'Por favor, insira um email valido';
                          }
                          if (value.length < 3) {
                            return 'O nome precisa ter pelo menos 3 letras';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Sua idade (Não é obrigatorio)',
                        controller: idadeController,
                        numerico: true,
                        icone: Icons.cake_outlined,
                        validador: (value) {
                          if (value == null || value.isEmpty) {
                            return null;
                          }

                          final int? numero = int.tryParse(value);

                          if (numero == null) {
                            return 'Por favor, Digite um número válido';
                          }

                          if (numero <= 8) {
                            return 'A idade deve ser maior que oito';
                          }
                          if (numero >= 100) {
                            return 'Por favor, Digite um número válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Cidade que mora (Não é obrigatorio)',
                        controller: cidadeMoraController,
                        icone: Icons.location_on_outlined,
                      ),
                      SizedBox(height: 15),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Nome de usuário',
                        controller: userNameController,
                        icone: Icons.alternate_email,
                        validador: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, preencha este campo';
                          }
                          if (value.length < 3) {
                            return 'O nome de usuário precisa ter pelo menos 3 letras';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Sua senha',
                        controller: passwordController,
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
                      SizedBox(height: 15),
                      Textfieldsdologin(
                        largura: 330,
                        placeHolder: 'Confirme sua senha',
                        controller: passwordConfirmController,
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
                          _formKey.currentState!.validate();
                          /*if (_formKey.currentState!.validate()) {
                            User? usuario =
                                await Authcontroller.cadastrarNovoUsuario(
                                  nameController.text,
                                  emailController.text,
                                  arquivoDeImagem?.path,
                                  passwordController.text,
                                  passwordConfirmController.text,
                                  int.tryParse(idadeController.text),
                                  cidadeMoraController.text,
                                  userNameController.text,
                                );
                            if (usuario != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Splash2(5, usuario),
                                ),
                              );
                            } else {
                              erroShowDialog(false);
                            }
                          }*/
                        },
                        child: AbsorbPointer(
                          child: ContainersWelcome(
                            cor: Color(0xFF6C63FF),
                            altura: 45,
                            comprimento: 330,
                            texto: 'Realizar cadastro',
                            radius: 10,
                            notOnlyDecoracao: false,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      ContainersWelcome(
                        cor: Color(0xFF1C0B2B),
                        altura: 40,
                        comprimento: 330,
                        texto: 'Já tenho uma conta',
                        url: null,
                        webOrMob: false,
                        radius: 0,
                        classe: Login(),
                        splash: false,
                        segs: 0,
                        volta: true,
                        saiApp: false,
                        notOnlyDecoracao: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
