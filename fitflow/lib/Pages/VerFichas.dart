import 'package:fitflow/WidgetsPersonalizados/Tabela.dart';
import 'package:fitflow/controle/ficha_exercicioController.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
import 'package:flutter/material.dart';

class Verfichas extends StatefulWidget {
  final Ficha ficha;

  const Verfichas({required this.ficha, super.key});

  @override
  State<Verfichas> createState() => _VerfichasState();
}

class _VerfichasState extends State<Verfichas> {
  late List<FichaExercicio> FichasExercicioArray = [];

  Future<void> carregarDados() async {
    try {
      final dados = await FichaExerciciocontroller.listarFichasExercicios(
        widget.ficha.id,
      );
      setState(() {
        FichasExercicioArray = dados;
      });
    } catch (x) {
      print("Sem dados persistidos $x");
    }
  }

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C0B2B),
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
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: 7,
        itemBuilder: (context, index) {
          List<String> arrayDias = [
            'Segunda',
            'Terça',
            'Quarta',
            'Quinta',
            'Sexta',
            'Sabado',
            'Domingo',
          ];

          String diaAtualDaSemana = arrayDias[index];

          try {
            final fichaExercicioSolitario = FichasExercicioArray.firstWhere(
              (element) => element.dias_semana == diaAtualDaSemana,
            );

            return Tabela(fichaExercicio: fichaExercicioSolitario);
          } catch (e) {
            return Tabela(dia: diaAtualDaSemana, eDia: false);
          }
        },
      ),
    );
  }
}
/*
ListView(
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


 */