import 'package:fitflow/WidgetsPersonalizados/Tabela.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:flutter/material.dart';

class Verfichas extends StatefulWidget {
  final Ficha ficha;

  const Verfichas({required this.ficha, super.key});

  @override
  State<Verfichas> createState() => _VerfichasState();
}

class _VerfichasState extends State<Verfichas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.ficha.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'fredoka',
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: Color(0xFF413B6B),
      body: ListView(
        children: [
          Tabela('Segunda'),
          Tabela('Terça'),
          Tabela('Quarta'),
          Tabela('Quinta'),
          Tabela('Sexta'),
          Tabela('Sabado'),
          Tabela('Domingo'),
        ],
      ),
    );
  }
}
