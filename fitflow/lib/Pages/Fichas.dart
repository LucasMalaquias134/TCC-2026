import 'package:fitflow/Pages/VerFichas.dart';
import 'package:fitflow/WidgetsPersonalizados/FichasBloco.dart';
import 'package:flutter/material.dart';

class Fichas extends StatelessWidget {
  const Fichas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF413B6B),
      child: ListView(
        children: [
          Fichasbloco(
            Verfichas('Treino'),
            1,
            'titulo',
            'inicio',
            'fim',
            'descricao',
          ),
          Fichasbloco(
            Verfichas('Treino'),
            1,
            'titulo',
            'inicio',
            'fim',
            'descricao',
          ),
          Fichasbloco(
            Verfichas('Treino'),
            1,
            'titulo',
            'inicio',
            'fim',
            'descricao',
          ),
          Fichasbloco(
            Verfichas('Treino'),
            1,
            'titulo',
            'inicio',
            'fim',
            'descricao',
          ),
          Fichasbloco(
            Verfichas('Treino'),
            1,
            'titulo',
            'inicio',
            'fim',
            'descricao',
          ),
          Fichasbloco(
            Verfichas('Treino'),
            1,
            'titulo',
            'inicio',
            'fim',
            'descricao',
          ),
        ],
      ),
    );
  }
}
