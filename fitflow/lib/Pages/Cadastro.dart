import 'dart:io';
import 'package:fitflow/Pages/Login.dart';
import 'package:fitflow/Splashes/Splash2.dart';
import 'package:fitflow/WidgetsPersonalizados/ContainersWelcome.dart';
import 'package:fitflow/WidgetsPersonalizados/TextFieldsDoLogin.dart';
import 'package:fitflow/controle/authController.dart';
import 'package:fitflow/modelo/classes/user.dart';
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
                  altura: 50,
                  icone: null,
                  placeHolder: 'Seu nome',
                  eSenha: false,
                  texto: nameController,
                  numerico: false,
                ),
                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: null,
                  placeHolder: 'Seu email',
                  eSenha: false,
                  texto: emailController,
                  numerico: false,
                ),

                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: null,
                  placeHolder: 'Sua idade (Não é obrigatorio)',
                  eSenha: false,
                  texto: idadeController,
                  numerico: true,
                ),
                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: null,
                  placeHolder: 'Cidade que mora (Não é obrigatorio)',
                  eSenha: false,
                  texto: cidadeMoraController,
                  numerico: false,
                ),
                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: null,
                  placeHolder: 'Nome de usuário',
                  eSenha: false,
                  texto: userNameController,
                  numerico: false,
                ),
                SizedBox(height: 40),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: null,
                  placeHolder: 'Sua senha',
                  eSenha: true,
                  texto: passwordController,
                  numerico: false,
                ),
                SizedBox(height: 20),
                Textfieldsdologin(
                  largura: 330,
                  altura: 50,
                  icone: null,
                  placeHolder: 'Confirme sua senha',
                  eSenha: true,
                  texto: passwordConfirmController,
                  numerico: false,
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        userNameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        passwordConfirmController.text.isEmpty) {
                      erroShowDialog(true);
                    } else {
                      User? usuario = await Authcontroller.cadastrarNovoUsuario(
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
                    }
                  },
                  child: AbsorbPointer(
                    child: ContainersWelcome(
                      cor: Color(0xFF5C65C0),
                      altura: 60,
                      comprimento: 330,
                      texto: 'Realizar cadastro',
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
          ],
        ),
      ),
    );
  }
}
