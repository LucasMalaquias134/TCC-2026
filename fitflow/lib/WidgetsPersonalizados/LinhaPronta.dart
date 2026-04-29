import 'package:fitflow/WidgetsPersonalizados/CelulaPersonalizada.dart';
import 'package:flutter/material.dart';

Row LinhaPronta(String treino, String desc, String peso, String repSeries) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Celulapersonalizada(Color(0xFF301C41), 30, 100, treino),
        Celulapersonalizada(Color(0xFF5C65C0), 30, 250, desc),
        Celulapersonalizada(Color(0xFF301C41), 30, 20, peso),
        Celulapersonalizada(Color(0xFF5C65C0), 30, 30, repSeries),
      ],
    );
