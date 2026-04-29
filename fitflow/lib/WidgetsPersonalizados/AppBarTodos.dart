import 'package:flutter/material.dart';

AppBar AppBarTodos(String urlDaImage, double paddingExiste) => AppBar(
  toolbarHeight: 70,
  backgroundColor: Color(0xFF1C0B2B),
  actions: [
    Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(paddingExiste),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image(image: AssetImage(urlDaImage)),
            ),
            SizedBox(width: 10),
            Text(
              'Usuario',
              style: TextStyle(
                fontFamily: 'fredoka',
                fontWeight: FontWeight(200),
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Spacer(),
            Image(image: AssetImage('assets/img/LogoMarcaComFitFlow.png')),
          ],
        ),
      ),
    ),
  ],
);
