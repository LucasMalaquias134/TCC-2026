import 'package:fitflow/Splashes/SplashEntrouAplicativo.dart';
import 'package:flutter/material.dart';

class Fichasbloco extends StatelessWidget {
  const Fichasbloco(
    this.tela,
    this.segs,
    this.titulo,
    this.dataInicio,
    this.dataFim,
    this.desc, {
    super.key,
  });

  final Widget tela;
  final int segs;

  final String titulo;
  final String dataInicio;
  final String dataFim;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Color(0xFF413B6B),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Splashentrouaplicativo(segs, tela),
            ),
          );
        },
        child: Container(
          color: Color(0xFF301C41),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/img/LogoMaisSombreada.png'),
                height: 60,
              ),
              VerticalDivider(
                thickness: 2,
                color: Colors.white,
                endIndent: 10,
                indent: 10,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'fredoka',
                        ),
                      ),
                      Text(
                        '$dataInicio - $dataFim',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'fredoka',
                        ),
                      ),
                      Divider(thickness: 2, height: 20, color: Colors.white),
                      Text(
                        '$desc',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'fredoka',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
