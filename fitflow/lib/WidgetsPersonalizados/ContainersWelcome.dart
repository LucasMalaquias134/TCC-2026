import 'package:fitflow/Splashes/SplashEntrouAplicativo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class ContainersWelcome extends StatelessWidget {
  const ContainersWelcome(
    this.cor,
    this.altura,
    this.comprimento,
    this.texto,
    this.url,
    this.webOrMob,
    this.radius,
    this.classe,
    this.splash,
    this.segs,
    this.volta,
    this.saiApp, {
    super.key,
  });

  final String texto;
  final Color cor;
  final double altura;
  final double comprimento;
  final bool? webOrMob;
  final String url;
  final double radius;
  final Widget classe;
  final bool? splash;
  final int segs;
  final bool? volta;
  final bool? saiApp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (saiApp == true) {
          SystemNavigator.pop();
        } else {
          if (webOrMob == true) {
            Uri minhaUrl = Uri.parse(url);
            launchUrl(minhaUrl, mode: LaunchMode.externalApplication);
          } else {
            if (segs > 0) {
              if (volta == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Splashentrouaplicativo(segs, classe),
                  ),
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Splashentrouaplicativo(segs, classe),
                  ),
                  (route) => false,
                );
              }
            } else {
              if (volta == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => classe),
                );
              } else if (volta == false) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => classe),
                  (route) => false,
                );
              }
            }
          }
        }
      },
      child: Container(
        width: comprimento,
        height: altura,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: cor,
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight(200),
            fontFamily: 'fredoka',
          ),
        ),
      ),
    );
  }
}
