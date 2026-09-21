import 'package:fitflow/Pages/VerFichas.dart';
import 'package:fitflow/Pages/VerFichasDetalhada.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/widgetsDoEditarUser.dart';
import 'package:fitflow/controle/fichaController.dart';
import 'package:fitflow/controle/tokenController.dart';
import 'package:fitflow/modelo/api/apiGeral.dart';
import 'package:fitflow/modelo/api/usersApi.dart';
import 'package:fitflow/modelo/classes/ficha.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:fitflow/modelo/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Fichas extends StatefulWidget {
  const Fichas({super.key});

  @override
  State<Fichas> createState() => _FichasState();
}

class _FichasState extends State<Fichas> {
  TextEditingController pesquisaController = TextEditingController();
  bool ordem = true;

  User? usuario;
  String? token;

  List<Ficha> FichasClasse = [];

  Future<void> carregarDados() async {
    try {
      User? usuarioAchado = await LocalStorageService.carregarUsuario();
      String? tokenAchado = await Tokencontroller.stringTokenCarregado();
      List<Ficha> fichasAchadas = await Fichacontroller.listarFichas('', true);
      setState(() {
        usuario = usuarioAchado;
        FichasClasse = fichasAchadas;
        token = tokenAchado;
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

  void barraDeFracasso(String texto) {
    SnackBar minhaSnack = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 6),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context).showSnackBar(minhaSnack);
  }

  @override
  Widget build(BuildContext context) {
    if (usuario == null || token == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carregando suas informações...',
                style: TextStyle(
                  color: Color(0xFF6E5CFF),
                  fontFamily: 'fredoka',
                  fontSize: 16,
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: Appbartodos(usuario: usuario!),
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
                ? Expanded(
                    child: RefreshIndicator(
                      color: Color(0xFF6E5CFF),
                      onRefresh: () async {
                        int resultado1 = await Usersapi.atualizaDados(token!);
                        int resultado2 = await Apigeral.atualizaInfo(
                          token!,
                          usuario!.id,
                        );
                        setState(() {
                          carregarDados();
                        });
                        if (resultado1 == 0 || resultado2 == 0) {
                          barraDeFracasso(
                            'Erro de conexão, tente novamente mais tarde',
                          );
                        } else if (resultado1 != 200 && resultado2 != 200) {
                          barraDeFracasso(
                            'Algo deu errado, tente novamente mais tarde, codigo erro : $resultado1 e $resultado2',
                          );
                        }
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(0),
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
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: RefreshIndicator(
                      color: Color(0xFF6E5CFF),
                      onRefresh: () async {
                        int resultado1 = await Usersapi.atualizaDados(token!);
                        int resultado2 = await Apigeral.atualizaInfo(
                          token!,
                          usuario!.id,
                        );
                        setState(() {
                          carregarDados();
                        });
                        if (resultado1 == 0 || resultado2 == 0) {
                          barraDeFracasso(
                            'Erro de conexão, tente novamente mais tarde',
                          );
                        } else if (resultado1 != 200 && resultado2 != 200) {
                          barraDeFracasso(
                            'Algo deu errado, tente novamente mais tarde, codigo erro : $resultado1 e $resultado2',
                          );
                        }
                      },
                      child: ListView.builder(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          '${ficha.data_inicio ?? ''} - ${ficha.data_fim ?? ''}',
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
                                        color: Colors.white.withValues(
                                          alpha: 0.4,
                                        ),
                                        fontFamily: 'fredoka',
                                        fontSize: 18,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : null,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Verfichas(ficha: ficha),
                                  ),
                                );
                              },
                              onLongPress: () {
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
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
