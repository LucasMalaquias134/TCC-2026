import 'package:fitflow/WidgetsPersonalizados/Tabela.dart';
import 'package:flutter/material.dart';

class Verfichas extends StatefulWidget {
  final String titulo;

  const Verfichas(this.titulo, {super.key});

  @override
  State<Verfichas> createState() => _VerfichasState();
}

class _VerfichasState extends State<Verfichas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
          style: TextStyle(fontFamily: 'fredoka', color: Colors.white),
        ),
        backgroundColor: Color(0xFF1C0B2B),
        iconTheme: IconThemeData(color: Colors.white),
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
