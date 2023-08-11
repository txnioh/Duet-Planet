import 'package:flutter/material.dart';


class Inicio1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/Girl.png'),),
            Text("Sistema Solar")
          ],
        )
   ));
  }
}