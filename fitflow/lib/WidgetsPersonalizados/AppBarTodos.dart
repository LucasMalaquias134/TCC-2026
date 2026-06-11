import 'package:fitflow/Pages/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitflow/Splashes/SplashEntrouAplicativo.dart';

class Appbartodos extends StatelessWidget implements PreferredSizeWidget {
  final String urlDaImage;

  const Appbartodos(this.urlDaImage, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

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
                CircleAvatar(
                  radius: 40,
                  backgroundImage: urlDaImage.isNotEmpty
                      ? AssetImage(urlDaImage)
                      : null,
                  child: urlDaImage.isEmpty
                      ? const Icon(
                          Icons.person_outline,
                          size: 40,
                          color: Colors.black,
                        )
                      : null,
                ),
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
                              Splashentrouaplicativo(5, Welcome()),
                        ),
                        (route) => false,
                      );
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
