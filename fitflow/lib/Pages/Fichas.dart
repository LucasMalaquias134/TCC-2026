import 'package:fitflow/Pages/CriarFicha.dart';
import 'package:fitflow/Pages/VerFichas.dart';
import 'package:fitflow/WidgetsPersonalizados/AppBarTodos.dart';
import 'package:fitflow/WidgetsPersonalizados/widgetsDoCriarFicha.dart';
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
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  late DateTime? dataInicio;
  late DateTime? dataFim;

  late List<Ficha> FichasClasse = [];
  int contador = 0;

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

  void mensagemSnackBar(String texto) {
    final snackBar = SnackBar(
      content: Text(
        texto,
        style: TextStyle(fontFamily: 'fredoka', color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> carregarDados() async {
    try {
      final dados = await Fichacontroller.listarFichas(widget.usuario.id);
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

  Future<bool?> edicaoShowDialog(Ficha ficha) async {
    name.text = ficha.name;
    if (ficha.descricao != null) {
      desc.text = ficha.descricao!;
    }
    dataInicio = DateTime.parse(ficha.data_inicio);
    dataFim = DateTime.parse(ficha.data_fim);
    bool? resultado = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                'Editar a ficha ${ficha.name}',
                style: TextStyle(fontFamily: 'fredoka'),
              ),
              content: Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldsDoShowDialogFichas(
                      controller: name,
                      titulo: 'Nome da Ficha',
                    ),
                    TextFieldsDoShowDialogFichas(
                      controller: desc,
                      titulo: 'Descrição da Ficha',
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        final DateTime? selecionada = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (selecionada != null) {
                          setDialogState(() {
                            dataInicio = selecionada;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: Color(0xFF433E75),
                        size: 20,
                      ),
                      label: Text(
                        dataInicio != null
                            ? 'Data de Inicio ' +
                                  DateFormat('dd/MM/yyyy').format(dataInicio!)
                            : 'DD/MM/AAAA',
                        style: TextStyle(
                          color: Color(0xFF433E75),
                          fontFamily: 'fredoka',
                        ),
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                    SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () async {
                        final DateTime? selecionada = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (selecionada != null) {
                          setDialogState(() {
                            dataFim = selecionada;
                          });
                        }
                      },
                      label: Text(
                        dataFim != null
                            ? 'Data do Fim ' +
                                  DateFormat('dd/MM/yyyy').format(dataFim!)
                            : 'DD/MM/AAAA',
                        style: TextStyle(
                          color: Color(0xFF433E75),
                          fontFamily: 'fredoka',
                        ),
                      ),
                      iconAlignment: IconAlignment.end,
                      icon: Icon(
                        Icons.calendar_month,
                        color: Color(0xFF433E75),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('Continuar'),
                ),
              ],
            );
          },
        );
      },
    );
    return resultado;
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

                  return Dismissible(
                    key: Key(ficha.id.toString()),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog<bool>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmar Exclusão'),
                            content: Text(
                              'Deseja mesmo deletar a ficha "${ficha.name}"?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print(ficha.id);
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(
                                  'Deletar',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) async {
                      bool resultado = await Fichacontroller.deletarFichas(
                        ficha.id,
                      );
                      if (resultado) {
                        setState(() {
                          FichasClasse.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${ficha.name} foi removido.'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        erroShowDialog('Algo deu errado, tente novamente');
                      }
                    },
                    child: Card(
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
                        title: Column(
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
                              '${DateFormat('dd/MM/yyyy').format(DateTime.parse(ficha.data_inicio))} - ${DateFormat('dd/MM/yyyy').format(DateTime.parse(ficha.data_fim))}',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.4),
                                fontFamily: 'fredoka',
                                fontSize: 15,
                              ),
                            ),
                          ],
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
                        onLongPress: () async {
                          bool? resultado = await edicaoShowDialog(ficha);
                          if (resultado == true) {
                            bool resultado2 =
                                await Fichacontroller.atualizarFichas(
                                  ficha.id,
                                  name.text,
                                  desc.text,
                                  dataInicio.toString(),
                                  dataFim.toString(),
                                );
                            if (resultado2 == true) {
                              mensagemSnackBar('Atualizado com sucesso!');
                              await carregarDados();
                            } else {
                              erroShowDialog(
                                'Há campos a serem preechidos ainda',
                              );
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final salvouComSucesso = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Criarficha(usuario: widget.usuario),
            ),
          );

          if (salvouComSucesso == true) {
            mensagemSnackBar('Criado com sucesso!');
            await carregarDados();
          }
        },
        backgroundColor: Color.fromARGB(255, 42, 152, 50),
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
