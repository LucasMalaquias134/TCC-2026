import 'package:fitflow/Pages/VerFichas.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/controle/fichaController.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Fichas extends StatefulWidget {
  final User usuario;
  const Fichas({required this.usuario, super.key});

  @override
  State<Fichas> createState() => _FichasState();
}

class _FichasState extends State<Fichas> {
  late List<Ficha> FichasClasse = [];

  Future<void> carregarDados() async {
    try {
      final dados = await Fichacontroller.listarFichas();
      setState(() {
        FichasClasse = dados;
      });
    } catch (x) {
      print("Sem dados persistidos $x");
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
      appBar: Appbartodos(usuario: widget.usuario),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Color(0xFF413B6B),
        child: FichasClasse.isEmpty
            ? Center(
                child: Text(
                  'Nenhuma ficha cadastrada',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'fredoka',
                    fontSize: 16,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(15),
                itemCount: FichasClasse.length,
                itemBuilder: (context, index) {
                  final ficha = FichasClasse[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    color: Color(0xFF322E5C),
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      trailing: Icon(
                        Icons.fitness_center,
                        color: Color(0xFF6C63FF),
                        size: 50,
                      ),
                      title:
                          (ficha.data_inicio != null && ficha.data_fim != null)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ficha.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'fredoka',
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '${DateFormat('dd/MM/yyyy').format(DateTime.tryParse(ficha.data_inicio ?? '')!)} - ${DateFormat('dd/MM/yyyy').format(DateTime.tryParse(ficha.data_fim ?? '')!)}',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.4),
                                    fontFamily: 'fredoka',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              ficha.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fredoka',
                                fontSize: 22,
                              ),
                            ),
                      subtitle: ficha.descricao != null
                          ? Text(
                              ficha.descricao!,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.4),
                                fontFamily: 'fredoka',
                                fontSize: 18,
                              ),
                            )
                          : null,
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verfichas(ficha: ficha),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
