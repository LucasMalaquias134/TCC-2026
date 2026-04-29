import 'package:fitflow/WidgetsPersonalizados/LinhaPronta.dart';
import 'package:flutter/material.dart';

Row LinhaPersonalizada(
  String treino,
  String desc,
  String peso,
  String repSeries,
) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinhaPronta(treino, desc, peso, repSeries),
          LinhaPronta(treino, desc, peso, repSeries),
          LinhaPronta(treino, desc, peso, repSeries),
          LinhaPronta(treino, desc, peso, repSeries),
          LinhaPronta(treino, desc, peso, repSeries),
        ],
      ),
    ),
  ],
);
