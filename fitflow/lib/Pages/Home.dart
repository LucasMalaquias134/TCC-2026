import 'package:fitflow/Pages/EditarUser.dart';
import 'package:fitflow/Pages/Fichas.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User usuario;
  const Home({required this.usuario, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selecionado = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> classes = [
      Fichas(usuario: widget.usuario),
      Editaruser(usuario: widget.usuario),
    ];
    return Scaffold(
      backgroundColor: Color(0xFF413B6B),
      body: classes[selecionado],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selecionado = index;
          });
        },
        currentIndex: selecionado,
        backgroundColor: Color(0xFF1C0B2B),
        selectedItemColor: Color(0xFF6f95ff),
        unselectedItemColor: Color(0xFF05C65C0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Vizualizar fichas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Gerenciar Usuario',
          ),
        ],
      ),
    );
  }
}
