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
                      ? Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white.withValues(alpha: 0.15),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          color: Color(0xFF4C49BD),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Text(
                                  'Dia de descanso',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'fredoka',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: DataTable(
                              headingRowColor: WidgetStateProperty.all(
                                Color(0xFF4C49BD),
                              ),
                              headingTextStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fredoka',
                              ),
                              dataTextStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fredoka',
                              ),
                              border: TableBorder.all(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                color: Colors.white.withValues(alpha: 0.15),
                              ),
                              columns: [
                                DataColumn(label: Text('Ordem')),
                                DataColumn(label: Text('Nome')),
                                DataColumn(label: Text('Series')),
                                DataColumn(label: Text('Reps')),
                                DataColumn(label: Text('Peso')),
                                DataColumn(label: Text('Descanso')),
                                DataColumn(label: Text('Descrição')),
                              ],
                              rows: exerciciosArray.map((exercicio) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(exercicio.ordem.toString())),
                                    DataCell(Text(exercicio.treino)),
                                    DataCell(Text('${exercicio.qntdSeries}')),
                                    DataCell(Text('${exercicio.qtndRep}')),
                                    DataCell(
                                      Text(
                                        exercicio.peso != null
                                            ? '${exercicio.peso} kg'
                                            : '-',
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        exercicio.descanso != null
                                            ? '${exercicio.descanso}s'
                                            : '-',
                                      ),
                                    ),
                                    DataCell(Text(exercicio.descricao ?? '-')),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
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
