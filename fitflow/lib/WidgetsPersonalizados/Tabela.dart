import 'package:fitflow/WidgetsPersonalizados/LinhaPersonalizada.dart';
import 'package:flutter/material.dart';

class Tabela extends StatelessWidget {
  const Tabela(this.titulo, {super.key});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 0),
              height: 50,
              child: Container(
                color: Color(0xFF301C41),
                width: 400,
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'fredoka',
                    fontWeight: FontWeight(400),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              //cada linha é 30
              height: 150,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LinhaPersonalizada(
                    "Lorem",
                    "Lorem IpsumNeque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                    "10",
                    "12x3",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
