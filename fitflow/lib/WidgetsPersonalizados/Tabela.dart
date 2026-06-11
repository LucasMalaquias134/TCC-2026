import 'package:flutter/material.dart';

class Tabela extends StatefulWidget {
  final String dia;

  const Tabela(this.dia, {super.key});

  @override
  State<Tabela> createState() => _TabelaState();
}

class _TabelaState extends State<Tabela> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 0),
              height: 50,
              child: Container(
                color: Color(0xFF301C41),
                width: 2000,
                child: Text(
                  widget.dia,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'fredoka',
                    fontWeight: FontWeight(400),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Color(0xFF301C41)),
                dataRowColor: WidgetStateProperty.all(Color(0xFF5C65C0)),
                columns: const [
                  DataColumn(
                    label: Text(
                      'Exercício',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Peso',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Repetições',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Series',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Descanso',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Descrição',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'fredoka',
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        //-------------------------------treino
                        Text(
                          'Supino Reto',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------peso
                        Text(
                          '30 kg',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------reps
                        Text(
                          '12',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------series
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------descanso
                        Text(
                          '60 segs',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          //-------------------------------desc
                          'Lorem ipsun kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        //-------------------------------treino
                        Text(
                          'Abdomen',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------peso
                        Text(
                          '5 kg',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------reps
                        Text(
                          '15',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------series
                        Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        //-------------------------------descanso
                        Text(
                          '60 segs',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          //-------------------------------desc
                          'Lorem ipsun jsjsjsjsjjsjsjdksdjskdsj',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'fredoka',
                          ),
                        ),
                      ),
                    ],
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
