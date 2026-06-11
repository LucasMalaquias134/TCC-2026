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
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Card(
        color: Color(0xFF301C41),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Splashentrouaplicativo(segs, tela),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'fredoka',
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$dataInicio - $dataFim',
                  style: TextStyle(color: Colors.white, fontFamily: 'fredoka'),
                ),
                SizedBox(height: 5),
                Divider(thickness: 2, height: 20, color: Colors.white),
                SizedBox(height: 5),
                Text(
                  '$desc',
                  style: TextStyle(color: Colors.white, fontFamily: 'fredoka'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
