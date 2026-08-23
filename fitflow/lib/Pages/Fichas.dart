import 'package:fitflow/Pages/VerFichas.dart';
import 'package:fitflow/Pages/VerFichasDetalhada.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/widgetsDoEditarUser.dart';
import 'package:fitflow/controle/fichaController.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class Fichas extends StatefulWidget {
  final User usuario;
  const Fichas({required this.usuario, super.key});

  @override
  State<Fichas> createState() => _FichasState();
}

class _FichasState extends State<Fichas> {
  TextEditingController pesquisaController = TextEditingController();
  bool ordem = true;

  late List<Ficha> FichasClasse = [];

  Future<void> carregarDados() async {
    try {
      final dados = await Fichacontroller.listarFichas('', ordem);
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        color: Color(0xFF130D26),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextfieldPesquisar(
                placeHolder: '',
                controller: pesquisaController,
                icone: Icons.search,
                labelFlutante: true,
                placeHolder2: 'Pesquisar fichas...',
                temRadius: true,
                radius: 15,
                enviado: (pesquisa) async {
                  List<Ficha> fichasPesquisadas =
                      await Fichacontroller.listarFichas(pesquisa, ordem);
                  setState(() {
                    FichasClasse = fichasPesquisadas;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: IconButton(
                    onPressed: () async {
                      ordem = !ordem;

                      List<Ficha> fichasPesquisadas =
                          await Fichacontroller.listarFichas(
                            pesquisaController.text,
                            ordem,
                          );
                      setState(() {
                        FichasClasse = fichasPesquisadas;
                      });
                    },
                    icon: ordem
                        ? Icon((Icons.filter_list), color: Colors.white)
                        : Transform.rotate(
                            angle: math.pi,
                            child: Icon(Icons.filter_list, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
            FichasClasse.isEmpty
                ? Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        (pesquisaController.text.trim().isEmpty)
                            ? 'Nenhuma ficha cadastrada'
                            : 'Nenhuma ficha cadastrada com esse nome \'${pesquisaController.text}\' ',
                        style: TextStyle(
                          color: Color(0xFF6E5CFF),
                          fontFamily: 'fredoka',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemCount: FichasClasse.length,
                    itemBuilder: (context, index) {
                      final ficha = FichasClasse[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.indigo.withValues(alpha: 0.3),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        color: Color(0xFF1B1437),
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          trailing: Icon(
                            Icons.fitness_center,
                            color: Color(0xFF6C63FF),
                            size: 50,
                          ),
                          title:
                              (ficha.data_inicio != null &&
                                  ficha.data_fim != null)
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
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${DateFormat('dd/MM/yyyy').format(DateTime.tryParse(ficha.data_inicio ?? '')!)} - ${DateFormat('dd/MM/yyyy').format(DateTime.tryParse(ficha.data_fim ?? '')!)}',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.4,
                                        ),
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
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          subtitle: ficha.descricao != null
                              ? Text(
                                  ficha.descricao!,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.4),
                                    fontFamily: 'fredoka',
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                          onLongPress: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Verfichasdetalhada(ficha: ficha),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
