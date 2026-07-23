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
      backgroundColor: Colors.transparent,
      body: classes[selecionado],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selecionado = index;
          });
        },
        currentIndex: selecionado,
        backgroundColor: Color(0xFF130D26),
        selectedItemColor: Color(0xFF6E5CFF),
        unselectedItemColor: Color(0xFF7E799B),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Vizualizar Fichas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Visualizar Perfil',
          ),
        ],
      ),
    );
  }
}
