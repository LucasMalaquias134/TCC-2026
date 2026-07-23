import 'package:fitflow/WidgetsPersonalizados/cardDoExpansionTile.dart';
import 'package:fitflow/controle/exercicioController.dart';
import 'package:fitflow/modelo/classes/exercicio.dart';
import 'package:fitflow/modelo/classes/ficha_exercicio.dart';
import 'package:flutter/material.dart';

class Tabela extends StatefulWidget {
  final FichaExercicio? fichaExercicio;
  final String? dia;
  final bool? eDia;

  const Tabela({this.fichaExercicio, this.dia, this.eDia = true, super.key});
  @override
  State<Tabela> createState() => _TabelaState();
}

class _TabelaState extends State<Tabela> {
  late List<Exercicio> exerciciosArray = [];

  Future<void> carregarDados() async {
    try {
      if (widget.fichaExercicio != null) {
        final dados = await Exerciciocontroller.listarExercicios(
          widget.fichaExercicio!,
        );
        setState(() {
          exerciciosArray = dados;
        });
      }
    } catch (x) {
      print("Sem dados persistidos $x");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
          width: 1.0,
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          backgroundColor: Color(0xFF4C49BD),
          collapsedBackgroundColor: Color(0xFF1B1437),
          iconColor: Colors.white,
          collapsedIconColor: Colors.white.withValues(alpha: 0.4),
          onExpansionChanged: (value) async {
            await carregarDados();
          },
          title: Text(
            (widget.fichaExercicio != null)
                ? '${widget.fichaExercicio!.dias_semana}'
                : '${widget.dia!}',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'fredoka',
              color: Colors.white,
            ),
          ),
          children: [
            Container(
              color: Color(0xFF2D254B),
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  !(widget.eDia == true)
                      ? Carddoexpansiontile(eDia: false)
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: exerciciosArray.length,
                          itemBuilder: (context, index) {
                            final exercicioAtual = exerciciosArray[index];

                            return Carddoexpansiontile(
                              nome: exercicioAtual.treino,
                              peso: exercicioAtual.peso != null
                                  ? '${exercicioAtual.peso} kg'
                                  : '-',
                              reps: '${exercicioAtual.qtndRep}',
                              series: '${exercicioAtual.qntdSeries}',
                              descanso: exercicioAtual.descanso != null
                                  ? '${exercicioAtual.descanso}s'
                                  : '-',
                              desc: exercicioAtual.descricao ?? '',
                            );
                          },
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
