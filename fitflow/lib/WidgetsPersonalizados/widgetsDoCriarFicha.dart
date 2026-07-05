import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldsCriarFicha extends StatelessWidget {
  final double? largura;
  final IconData? icone;
  final String placeHolder;
  final String? placeHolder2;
  final bool? eSenha;
  final TextEditingController controller;
  final bool? numerico;
  final String? Function(String?)? validador;
  final bool? labelFlutante;
  final bool? temaEscuro;
  final double? radius;
  final Color? corErro;
  const TextFieldsCriarFicha({
    this.largura,
    this.icone,
    required this.placeHolder,
    this.placeHolder2,
    this.eSenha,
    this.numerico,
    required this.controller,
    this.validador,
    this.labelFlutante,
    this.temaEscuro,
    this.radius,
    this.corErro,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((radius ?? 0)),
        border: Border.all(
          color: corErro != null
              ? corErro!
              : Colors.white.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: TextFormField(
        validator: validador,
        style: TextStyle(
          color: temaEscuro == true ? Colors.black : Colors.white,
          fontFamily: 'fredoka',
          fontSize: 14,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: labelFlutante == true
              ? FloatingLabelBehavior.always
              : null,
          prefixIcon: icone != null
              ? Icon(
                  icone,
                  color: temaEscuro == true ? Colors.black : Colors.white,
                )
              : null,
          labelText: placeHolder,
          labelStyle: TextStyle(
            color: temaEscuro == true ? Colors.black : Colors.white,
            fontFamily: 'fredoka',
            fontSize: 18,
          ),
          hintText: placeHolder2 != null ? placeHolder2 : placeHolder,
          hintStyle: TextStyle(
            color: temaEscuro == true
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.white.withValues(alpha: 0.4),
            fontFamily: 'fredoka',
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
        obscureText: eSenha == null ? false : true,
        controller: controller,
      ),
    );
  }
}

//=============================================================================

class mostrarData extends StatelessWidget {
  final DateTime? data;
  final String titulo;
  const mostrarData({required this.data, required this.titulo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'fredoka',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  data != null
                      ? DateFormat('dd/MM/yyyy').format(data!)
                      : 'DD/MM/AAAA',
                  style: TextStyle(
                    color: data != null
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                    fontFamily: 'fredoka',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Icon(
            Icons.calendar_month,
            color: Colors.white.withValues(alpha: 0.5),
            size: 20,
          ),
        ],
      ),
    );
  }
}

//=============================================================================

class TextFieldsDoShowDialogFichas extends StatelessWidget {
  final String titulo;
  final TextEditingController controller;
  const TextFieldsDoShowDialogFichas({
    required this.controller,
    required this.titulo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'fredoka',
            fontSize: 20,
          ),
          decoration: InputDecoration(
            hintText: titulo,
            hintStyle: TextStyle(
              color: Colors.black.withValues(alpha: 0.3),
              fontFamily: 'fredoka',
              fontSize: 20,
            ),
            label: Text(titulo),
            labelStyle: TextStyle(
              color: Color(0xFF433E75),
              fontFamily: 'fredoka',
              fontSize: 20,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          controller: controller,
          cursorColor: Colors.grey,
        ),
      ),
    );
  }
}
