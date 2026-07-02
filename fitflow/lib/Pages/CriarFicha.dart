import 'package:fitflow/WidgetsPersonalizados/widgetsDoCriarFicha.dart';
import 'package:fitflow/controle/fichaController.dart';
import 'package:fitflow/modelo/classes/user.dart';
import 'package:flutter/material.dart';

class Criarficha extends StatefulWidget {
  final User usuario;
  const Criarficha({required this.usuario, super.key});

  @override
  State<Criarficha> createState() => _CriarfichaState();
}

class _CriarfichaState extends State<Criarficha> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  DateTime? dataInicio;
  DateTime? dataFim;

  Future<void> selecionarData(BuildContext context, bool eDataInicio) async {
    DateTime? selecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selecionada != null) {
      setState(() {
        if (eDataInicio) {
          dataInicio = selecionada;
        } else {
          dataFim = selecionada;
        }
      });
    }
  }

  void erroShowDialog(String erro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: Text(erro),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF322E5C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Criar nova ficha de treino',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'fredoka',
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Card(
              elevation: 4,
              color: Color(0xFF2E2C54),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFieldsCriarFicha(
                          controller: nomeController,
                          label: 'Nome do Treino',
                          hint: 'Ex: Treino Hipertrofia',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await selecionarData(context, true);
                            },
                            child: mostrarData(
                              data: dataInicio,
                              titulo: 'Data de Início',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await selecionarData(context, false);
                            },
                            child: mostrarData(
                              data: dataFim,
                              titulo: 'Data de Fim',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFieldsCriarFicha(
                          controller: descricaoController,
                          label: 'Descrição (Opcional)',
                          hint: 'Digite detalhes ou observações...',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (nomeController.text.trim().isEmpty ||
                                  dataInicio == null ||
                                  dataFim == null) {
                                erroShowDialog(
                                  'Ainda há campos a serem preenchidos!',
                                );
                              } else {
                                bool resultado =
                                    await Fichacontroller.criarFicha(
                                      widget.usuario.id,
                                      nomeController.text,
                                      descricaoController.text,
                                      dataInicio!.toString(),
                                      dataFim!.toString(),
                                    );
                                if (resultado) {
                                  Navigator.pop(context, true);
                                } else {
                                  erroShowDialog(
                                    'Algo deu errado, tente novamente',
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6C63FF),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Salvar Ficha de Treino',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fredoka',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        //=====================================================================================================================================================
                        TextButton(
                          onPressed: () async {
                            final fichasa = await Fichacontroller.listarFichas(
                              widget.usuario.id,
                            );
                            print('ola usuario : ${widget.usuario.id}');
                            //print(fichasa[0].user_id);
                            fichasa.forEach((element) {
                              print(
                                '${element.id} + ${element.user_id} + ${element.descricao}',
                              );
                            });
                          },
                          child: Text('ola'),
                        ),
                        //=====================================================================================================================================================
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
