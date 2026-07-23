import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Verfichasdetalhada extends StatelessWidget {
  final Ficha ficha;
  const Verfichasdetalhada({required this.ficha, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF130D26),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          ficha.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'fredoka',
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF130D26),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ajudaRapida(titulo1: 'Nome da Ficha', titulo2: ficha.name),
                  ajudaRapida(
                    titulo1: 'Datas da Ficha',
                    titulo2:
                        'De ${DateFormat('dd/MM/yyyy').format(DateTime.tryParse(ficha.data_inicio ?? '')!)} até ${DateFormat('dd/MM/yyyy').format(DateTime.tryParse(ficha.data_fim ?? '')!)}',
                  ),
                  ajudaRapida(
                    titulo1: 'Descrição da Ficha',
                    titulo2: ficha.descricao ?? 'Não tem descrição',
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

class ajudaRapida extends StatelessWidget {
  final String titulo1;
  final String titulo2;
  const ajudaRapida({required this.titulo1, required this.titulo2, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo1,
                    style: TextStyle(
                      color: Color(0xFF6E5CFF),
                      fontFamily: 'fredoka',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          titulo2,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            elevation: 4,
            color: Color(0xFF1B1437),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
        ),
      ],
    );
  }
}
