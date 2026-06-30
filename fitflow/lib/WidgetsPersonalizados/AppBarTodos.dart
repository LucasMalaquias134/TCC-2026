import 'dart:io';

import 'package:fitflow/Pages/Welcome.dart';
import 'package:fitflow/Splashes/SplashEntrouAplicativo.dart';
import 'package:fitflow/controle/authController.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Appbartodos extends StatefulWidget implements PreferredSizeWidget {
  final User usuario;

  const Appbartodos({required this.usuario, super.key});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  State<Appbartodos> createState() => _AppbartodosState();
}

class _AppbartodosState extends State<Appbartodos> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      backgroundColor: Color(0xFF1C0B2B),
      actions: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF6C63FF).withValues(alpha: 0.3),
                  child:
                      widget.usuario.urlImage == null ||
                          widget.usuario.urlImage!.isEmpty
                      ? const Icon(Icons.person, size: 30, color: Colors.white)
                      : ClipOval(
                          child: SizedBox(
                            width: 49,
                            height: 49,
                            child: Image.file(
                              File(widget.usuario.urlImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                Expanded(
                  child: Text(
                    widget.usuario.user_name,
                    style: TextStyle(
                      fontFamily: 'fredoka',
                      fontWeight: FontWeight(200),
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  color: Color(0xFF6F95FF),
                  onSelected: (String valor) async {
                    if (valor == 'deslogar') {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Splashentrouaplicativo(5, Welcome()),
                        ),
                        (route) => false,
                      );
                      await Authcontroller.deslogarUsuario();
                      //lógica para deslogar aqui
                    } else if (valor == 'sair') {
                      SystemNavigator.pop();
                      //lógica para fechar o app aqui
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'deslogar',
                          child: Row(
                            children: [
                              Icon(Icons.logout, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  fontFamily: 'fredoka',
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'sair',
                          child: Row(
                            children: [
                              Icon(Icons.close, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                'Sair do app',
                                style: TextStyle(
                                  fontFamily: 'fredoka',
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
