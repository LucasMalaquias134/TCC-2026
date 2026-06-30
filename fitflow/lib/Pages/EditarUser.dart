import 'dart:io';

import 'package:fitflow/Pages/HelpSenhaEditarUser.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/widgetsDoEditarUser.dart';
import 'package:fitflow/controle/userController.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Editaruser extends StatefulWidget {
  final User usuario;

  const Editaruser({required this.usuario, super.key});

  @override
  State<Editaruser> createState() => _EditaruserState();
}

class _EditaruserState extends State<Editaruser> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  late String senhaSegura;

  File? arquivoDeImagem;

  final ImagePicker picker = ImagePicker();

  Future<void> selecionaImagen() async {
    final XFile? selectedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (selectedImage != null) {
      bool atualizarImg = await Usercontroller.atualizarImagem(
        selectedImage.path,
        widget.usuario.id,
      );
      if (atualizarImg) {
        setState(() {
          widget.usuario.urlImage = selectedImage.path;
        });
      } else {
        erroShowDialogImg();
      }
    }
  }

  void erroShowDialogImg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: Text('Algo deu errado tente de novo.'),
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

  void mensagemSnackBar() {
    final snackBar = SnackBar(
      content: Text(
        'Atualizado com sucesso!',
        style: TextStyle(fontFamily: 'fredoka', color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool?> pedirSenha() async {
    bool? resultado = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Insira sua senha',
            style: TextStyle(fontFamily: 'fredoka'),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'fredoka',
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Senha Atual',
                      hintStyle: TextStyle(
                        color: Colors.black.withValues(alpha: 0.3),
                        fontFamily: 'fredoka',
                        fontSize: 24,
                      ),
                    ),
                    cursorColor: Colors.grey,
                    obscureText: true,
                    controller: senhaController,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (senhaController.text == widget.usuario.password) {
                  Navigator.pop(context, true);
                } else {
                  Navigator.pop(context, false);
                }
              },
              child: Text('Continuar'),
            ),
          ],
        );
      },
    );
    return resultado;
  }

  void erroShowDialog(String erro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: Text(erro),
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

  Future<void> ShowDialogDeletarImg() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: Text('Deseja excluir sua foto?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                bool atualizarImg = await Usercontroller.atualizarImagem(
                  '',
                  widget.usuario.id,
                );
                if (atualizarImg) {
                  setState(() {
                    widget.usuario.urlImage = '';
                  });
                } else {
                  erroShowDialogImg();
                }
                Navigator.pop(context);
              },
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbartodos(usuario: widget.usuario),
      body: Container(
        color: Color(0xFF413B6B),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await selecionaImagen();
                        },
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Color(
                            0xFF6C63FF,
                          ).withValues(alpha: 0.3),
                          child:
                              widget.usuario.urlImage == null ||
                                  widget.usuario.urlImage!.isEmpty
                              ? const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white,
                                )
                              : ClipOval(
                                  child: SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: Image.file(
                                      File(widget.usuario.urlImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await ShowDialogDeletarImg();
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.redAccent,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.usuario.user_name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: .center,
                              children: [
                                cartaoPadrao(
                                  icone: Icons.person_outline,
                                  titulo: 'Nome',
                                  titulo2: widget.usuario.name,
                                ),
                                SizedBox(height: 10),
                                cartaoPadrao(
                                  icone: Icons.alternate_email,
                                  titulo: 'Nome de usuário',
                                  titulo2: widget.usuario.user_name,
                                ),
                                SizedBox(height: 10),
                                cartaoPadrao(
                                  icone: Icons.email_outlined,
                                  titulo: 'Email',
                                  titulo2: widget.usuario.email,
                                ),
                                SizedBox(height: 10),
                                cartaoPadrao(
                                  icone: Icons.cake_outlined,
                                  titulo: 'Idade',
                                  titulo2:
                                      (widget.usuario.idade
                                              .toString()
                                              .isNotEmpty &&
                                          widget.usuario.idade?.toString() !=
                                              null)
                                      ? widget.usuario.idade.toString()
                                      : 'Não informado',
                                ),
                                SizedBox(height: 10),
                                cartaoPadrao(
                                  icone: Icons.location_on_outlined,
                                  titulo: 'Cidade que mora',
                                  titulo2:
                                      (widget.usuario.cidadeMora != null &&
                                          widget.usuario.cidadeMora!
                                              .trim()
                                              .isNotEmpty)
                                      ? widget.usuario.cidadeMora!
                                      : 'Não informado',
                                ),
                              ],
                            ),
                          ),
                          elevation: 4,
                          color: Color(0xFF2E2C54),
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: .center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        'Mude suas informações',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'fredoka',
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    textfieldsDoEditarUser(
                                      controller: nameController,
                                      titulo: 'Nome',
                                      numerico: false,
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3F3D6B),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        tooltip: 'Atualizar nome',
                                        onPressed: () async {
                                          bool? resultado = await pedirSenha();

                                          switch (resultado) {
                                            case true:
                                              senhaSegura =
                                                  senhaController.text;
                                              senhaController.clear();
                                              bool resultado2 =
                                                  await Usercontroller.atualizarNome(
                                                    nameController.text,
                                                    widget.usuario.id,
                                                  );

                                              if (resultado2) {
                                                setState(() {
                                                  widget.usuario.name =
                                                      nameController.text;
                                                });
                                                mensagemSnackBar();
                                              } else {
                                                erroShowDialog(
                                                  'Algo deu errado tente novamente',
                                                );
                                              }
                                              senhaSegura = '';
                                              nameController.clear();
                                              break;
                                            case false:
                                              senhaController.clear();
                                              erroShowDialog(
                                                'Senha errada tente novamente',
                                              );
                                              senhaSegura = '';
                                              break;
                                            default:
                                              senhaController.clear();
                                              senhaSegura = '';
                                          }
                                        },
                                        icon: Icon(
                                          Icons.save,
                                          color: Color(0xFF6C63FF),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    textfieldsDoEditarUser(
                                      controller: userNameController,
                                      titulo: 'Nome de usuário',
                                      numerico: false,
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3F3D6B),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        tooltip: 'Atualizar nome de usuário',
                                        onPressed: () async {
                                          bool? resultado = await pedirSenha();

                                          switch (resultado) {
                                            case true:
                                              senhaSegura =
                                                  senhaController.text;
                                              senhaController.clear();
                                              bool resultado2 =
                                                  await Usercontroller.atualizarUserName(
                                                    userNameController.text,
                                                    widget.usuario.id,
                                                  );

                                              if (resultado2) {
                                                setState(() {
                                                  widget.usuario.user_name =
                                                      userNameController.text;
                                                });
                                                mensagemSnackBar();
                                              } else {
                                                erroShowDialog(
                                                  'Algo deu errado tente novamente',
                                                );
                                              }
                                              senhaSegura = '';
                                              userNameController.clear();
                                              break;
                                            case false:
                                              senhaController.clear();
                                              erroShowDialog(
                                                'Senha errada tente novamente',
                                              );
                                              senhaSegura = '';
                                              break;
                                            default:
                                              senhaController.clear();
                                              senhaSegura = '';
                                          }
                                        },
                                        icon: Icon(
                                          Icons.save,
                                          color: Color(0xFF6C63FF),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    textfieldsDoEditarUser(
                                      controller: idadeController,
                                      titulo: 'Idade',
                                      numerico: true,
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3F3D6B),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        tooltip: 'Atualizar idade',
                                        onPressed: () async {
                                          bool? resultado = await pedirSenha();

                                          switch (resultado) {
                                            case true:
                                              senhaSegura =
                                                  senhaController.text;
                                              senhaController.clear();
                                              bool resultado2 =
                                                  await Usercontroller.atualizarIdade(
                                                    int.tryParse(
                                                      idadeController.text,
                                                    ),
                                                    widget.usuario.id,
                                                  );

                                              if (resultado2) {
                                                setState(() {
                                                  widget.usuario.idade =
                                                      int.tryParse(
                                                        idadeController.text,
                                                      );
                                                });
                                                mensagemSnackBar();
                                              } else {
                                                erroShowDialog(
                                                  'Algo deu errado tente novamente',
                                                );
                                              }
                                              senhaSegura = '';
                                              idadeController.clear();
                                              break;
                                            case false:
                                              senhaController.clear();
                                              erroShowDialog(
                                                'Senha errada tente novamente',
                                              );
                                              senhaSegura = '';
                                              break;
                                            default:
                                              senhaController.clear();
                                              senhaSegura = '';
                                          }
                                        },
                                        icon: Icon(
                                          Icons.save,
                                          color: Color(0xFF6C63FF),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    textfieldsDoEditarUser(
                                      controller: cidadeController,
                                      titulo: 'Cidade que mora',
                                      numerico: false,
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3F3D6B),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        tooltip: 'Atualizar cidade',
                                        onPressed: () async {
                                          bool? resultado = await pedirSenha();

                                          switch (resultado) {
                                            case true:
                                              senhaSegura =
                                                  senhaController.text;
                                              senhaController.clear();
                                              bool resultado2 =
                                                  await Usercontroller.atualizarCidade(
                                                    cidadeController.text,
                                                    widget.usuario.id,
                                                  );

                                              if (resultado2) {
                                                setState(() {
                                                  widget.usuario.cidadeMora =
                                                      cidadeController.text;
                                                });
                                                mensagemSnackBar();
                                              } else {
                                                erroShowDialog(
                                                  'Algo deu errado tente novamente',
                                                );
                                              }
                                              senhaSegura = '';
                                              cidadeController.clear();
                                              break;
                                            case false:
                                              senhaController.clear();
                                              erroShowDialog(
                                                'Senha errada tente novamente',
                                              );
                                              senhaSegura = '';
                                              break;
                                            default:
                                              senhaController.clear();
                                              senhaSegura = '';
                                          }
                                        },
                                        icon: Icon(
                                          Icons.save,
                                          color: Color(0xFF6C63FF),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          elevation: 4,
                          color: Color(0xFF2E2C54),
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                  cartaoNavigator(
                    icone: Icons.lock_outline,
                    classe: Helpsenhaeditaruser(),
                    titulo: 'Recuperar Senha',
                  ),
                  cartaoNavigator(
                    icone: Icons.email_outlined,
                    classe: Helpsenhaeditaruser(),
                    titulo: 'Mudar de email',
                  ),
                ],
              ),
            ), //APAGUEI DAQUI PARA BAIXO
          ],
        ),
      ),
    );
  }
}
