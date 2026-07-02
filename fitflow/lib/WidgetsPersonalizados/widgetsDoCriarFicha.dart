import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldsCriarFicha extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  const TextFieldsCriarFicha({
    required this.hint,
    required this.controller,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFF433E75),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.15),
            width: 1.5,
          ),
        ),
        child: TextField(
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'fredoka',
            fontSize: 14,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'fredoka',
              fontSize: 18,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontFamily: 'fredoka',
              fontSize: 14,
            ),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          controller: controller,
        ),
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
        color: Color(0xFF433E75),
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
