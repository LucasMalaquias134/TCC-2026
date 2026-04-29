import 'package:flutter/material.dart';

Container Celulapersonalizada(
  Color cor,
  double altura,
  double largura,
  String texto,
) => Container(
  width: largura, //recomendado 150
  height: altura, //recomendado 30
  color: Colors.transparent,
  padding: EdgeInsets.only(left: 2.5, right: 2.5, top: 2.5),
  child: Container(
    color: cor, //5C65C0 ou 301C41
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            texto,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontFamily: 'fredoka',
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  ),
);
