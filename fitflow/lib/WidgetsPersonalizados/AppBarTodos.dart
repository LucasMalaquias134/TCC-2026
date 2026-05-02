import 'package:fitflow/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitflow/Splashes/SplashEntrouAplicativo.dart';

class Appbartodos extends StatefulWidget implements PreferredSizeWidget {
  final String urlDaImage;
  final double paddingExiste;

  const Appbartodos(this.urlDaImage, this.paddingExiste, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<Appbartodos> createState() => _AppbartodosState();
}

class _AppbartodosState extends State<Appbartodos> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(widget.paddingExiste),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image(image: AssetImage(widget.urlDaImage)),
                ),
                SizedBox(width: 10),
                Text(
                  'Usuario',
                  style: TextStyle(
                    fontFamily: 'fredoka',
                    fontWeight: FontWeight(200),
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  color: Color(0xFF6F95FF),
                  onSelected: (String valor) {
                    if (valor == 'deslogar') {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Splashentrouaplicativo(5, Login()),
                        ),
                        (route) => false,
                      );
                      // Sua lógica para deslogar aqui
                    } else if (valor == 'sair') {
                      SystemNavigator.pop();
                      // Sua lógica para fechar o app aqui
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
    ;
  }
}
