import 'package:flutter/material.dart';


class Inicio2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 117, 117, 117),
      body: Center(
        child: Image(image: AssetImage('assets/images/Astronaut.png'),)
   ));
  }
}