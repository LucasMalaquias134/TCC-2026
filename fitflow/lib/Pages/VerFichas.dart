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
      List<FichaExercicio>? listaAchada =
          await FichaExerciciocontroller.listarFichaExercicio(widget.ficha.id);

      setState(() {
        FichasExercicioArray = listaAchada ?? [];
      });
    } catch (e) {
      print("Sem dados persistidos ( metodo 1 ) $e");
    }
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

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
          widget.ficha.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'fredoka',
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: Color(0xFF130D26),
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
          List<String> arrayDiasSimples = [
            'seg',
            'ter',
            'qua',
            'qui',
            'sex',
            'sab',
            'dom',
          ];

          String diaAtualDaSemana = arrayDiasSimples[index];

          try {
            final fichaExercicioDia = FichasExercicioArray.where(
              (element) => element.dias_semana == diaAtualDaSemana,
            ).toList();

            return Tabela(
              fichaExercicio: fichaExercicioDia,
              dia: arrayDias[index],
            );
          } catch (e) {
            print('Deu erro aqui no return de um listview builder : $e');
            return null;
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
