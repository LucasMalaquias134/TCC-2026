import 'dart:io';

import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/widgetsDoEditarUser.dart';
import 'package:fitflow/controle/tokenController.dart';
import 'package:fitflow/modelo/api/apiGeral.dart';
import 'package:fitflow/modelo/api/usersApi.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:flutter/material.dart';

class Editaruser extends StatefulWidget {
  const Editaruser({super.key});

  @override
  State<Editaruser> createState() => _EditaruserState();
}

class _EditaruserState extends State<Editaruser> {
  String? token;
  User? usuario;

  void barraDeFracasso(String texto) {
    SnackBar minhaSnack = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 6),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(minhaSnack);
  }

  Future<void> carregarDados() async {
    try {
      User? usuarioAchado = await LocalStorageService.carregarUsuario();
      String? tokenAchado = await Tokencontroller.stringTokenCarregado();
      setState(() {
        usuario = usuarioAchado;
        token = tokenAchado;
      });
    } catch (e) {
      print("Sem dados persistidos ( metodo 1 ) $e");
    }
  }

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (usuario == null || token == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carregando suas informações...',
                style: TextStyle(
                  color: Color(0xFF6E5CFF),
                  fontFamily: 'fredoka',
                  fontSize: 16,
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: Appbartodos(usuario: usuario!),
      body: Container(
        color: Color(0xFF130D26),
        child: RefreshIndicator(
          color: Color(0xFF6E5CFF),
          onRefresh: () async {
            int resultado1 = await Usersapi.atualizaDados(token!);
            int resultado2 = await Apigeral.atualizaInfo(token!, usuario!.id);
            setState(() {
              carregarDados();
            });
            if (resultado1 == 0 || resultado2 == 0) {
              barraDeFracasso('Erro de conexão, tente novamente mais tarde');
            } else if (resultado1 != 200 && resultado2 != 200) {
              barraDeFracasso(
                'Algo deu errado, tente novamente mais tarde, codigo erro : $resultado1 e $resultado2',
              );
            }
          },
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFF1B1437),
                      child:
                          usuario!.urlImage == null ||
                              usuario!.urlImage!.isEmpty
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
                                  File(usuario!.urlImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            usuario!.user_name,
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
                                    titulo2: usuario!.name,
                                  ),
                                  Divider(color: Colors.white12, height: 20),
                                  SizedBox(height: 10),
                                  cartaoPadrao(
                                    icone: Icons.alternate_email,
                                    titulo: 'Nome de usuário',
                                    titulo2: usuario!.user_name,
                                  ),
                                  Divider(color: Colors.white12, height: 20),
                                  SizedBox(height: 10),
                                  cartaoPadrao(
                                    icone: Icons.email_outlined,
                                    titulo: 'Email',
                                    titulo2: usuario!.email,
                                  ),
                                  Divider(color: Colors.white12, height: 20),
                                  SizedBox(height: 10),
                                  cartaoPadrao(
                                    icone: Icons.cake_outlined,
                                    titulo: 'Idade',
                                    titulo2:
                                        (usuario!.idade.toString().isNotEmpty &&
                                            usuario!.idade?.toString() != null)
                                        ? usuario!.idade.toString()
                                        : 'Não informado',
                                  ),
                                  Divider(color: Colors.white12, height: 20),
                                  SizedBox(height: 10),
                                  cartaoPadrao(
                                    icone: Icons.location_on_outlined,
                                    titulo: 'Cidade que mora',
                                    titulo2:
                                        (usuario!.cidadeMora != null &&
                                            usuario!.cidadeMora!
                                                .trim()
                                                .isNotEmpty)
                                        ? usuario!.cidadeMora!
                                        : 'Não informado',
                                  ),
                                ],
                              ),
                            ),
                            elevation: 4,
                            color: Color(0xFF1B1437),
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                      ],
                    ),

                    cartaoNavigator(
                      icone: Icons.open_in_new,
                      titulo: 'Acessar Web',
                    ),
                  ],
                ),
              ), //APAGUEI DAQUI PARA BAIXO
            ],
          ),
        ),
      ),
    );
  }
}
