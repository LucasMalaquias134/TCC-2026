import 'package:flutter/material.dart';

Row Textfieldsdouseredit(String texto, bool eSenha) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.transparent,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$texto :",
              style: TextStyle(
                fontFamily: 'fredoka',
                color: Colors.white,
                fontWeight: FontWeight(400),
                fontSize: 16,
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 30,
              width: 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    width: 166,
                    height: 30,
                    child: TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 18),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: texto,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'fredoka',
                          fontSize: 14,
                        ),
                      ),
                      cursorHeight: 15,
                      obscureText: eSenha,
                    ),
                  ),
                  Icon(Icons.edit, color: Color(0xFF301c41)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);
