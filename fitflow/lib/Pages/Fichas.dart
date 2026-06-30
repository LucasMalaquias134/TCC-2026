import 'package:fitflow/Pages/VerFichas.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/FichasBloco.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';

class Fichas extends StatefulWidget {
  final User usuario;
  const Fichas({required this.usuario, super.key});

  @override
  State<Fichas> createState() => _FichasState();
}

class _FichasState extends State<Fichas> {
  final List<Widget> fichas = [];
  int contador = 0;

  void adicionarNovaFicha() {
    setState(() {
      contador++;

      fichas.add(
        Fichasbloco(
          key: UniqueKey(),
          Verfichas('Treino'),
          1,
          'Titulo',
          'inicio',
          'fim',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac lorem arcu. Aliquam vitae lectus ante. Praesent blandit elementum accumsan. Phasellus hend',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbartodos(usuario: widget.usuario),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: Color(0xFF413B6B),
          child: ListView(children: fichas),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          adicionarNovaFicha();
        },
        child: const Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.green,
      ),
    );
  }
}
