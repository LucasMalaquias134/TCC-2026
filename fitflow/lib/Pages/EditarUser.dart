import 'dart:io';

import 'package:fitflow/Pages/HelpSenhaEditarUser.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/widgetsDoEditarUser.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';

class Editaruser extends StatefulWidget {
  final User usuario;

  const Editaruser({required this.usuario, super.key});

  @override
  State<Editaruser> createState() => _EditaruserState();
}

class _EditaruserState extends State<Editaruser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbartodos(usuario: widget.usuario),
      body: Container(
        color: Color(0xFF130D26),
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
                          color: Color(0xFF1B1437),
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
                ],
              ),
            ), //APAGUEI DAQUI PARA BAIXO
          ],
        ),
      ),
    );
  }
}
