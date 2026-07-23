import 'package:flutter/material.dart';

class Carddoexpansiontile extends StatefulWidget {
  final String? nome;
  final String? peso;
  final String? reps;
  final String? series;
  final String? descanso;
  final String? desc;
  final bool? eDia;
  const Carddoexpansiontile({
    this.nome,
    this.desc,
    this.descanso,
    this.peso,
    this.reps,
    this.series,
    this.eDia = true,
    super.key,
  });

  @override
  State<Carddoexpansiontile> createState() => _CarddoexpansiontileState();
}

class _CarddoexpansiontileState extends State<Carddoexpansiontile> {
  Color corCard = Color(0xFF4C49BD);

  @override
  Widget build(BuildContext context) {
    return widget.eDia == true
        ? GestureDetector(
            onTap: () {
              setState(() {
                corCard = (corCard == Color(0xFF4C49BD))
                    ? Colors.green
                    : Color(0xFF4C49BD);
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(bottom: 10),
              color: corCard,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nome!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'fredoka',
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        colunaDeInfo('Séries', widget.series!),
                        colunaDeInfo('Reps', widget.reps!),
                        colunaDeInfo('Peso', widget.peso!),
                        colunaDeInfo('Descanso', widget.descanso!),
                      ],
                    ),

                    if (widget.desc!.isNotEmpty) ...[
                      Divider(
                        color: Colors.white.withValues(alpha: 0.5),
                        height: 20,
                      ),
                      Text(
                        widget.desc!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 13,
                          fontFamily: 'fredoka',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          )
        : Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 10),
            color: corCard,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    'Dia de descanso',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'fredoka',
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget colunaDeInfo(String texto, String valor) {
    return Column(
      children: [
        Text(
          texto,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 11,
            fontFamily: 'fredoka',
          ),
        ),
        SizedBox(height: 2),
        Text(
          valor,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'fredoka',
          ),
        ),
      ],
    );
  }
}
