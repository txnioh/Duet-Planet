
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_5/src/pages/game_manual_page.dart';
import 'package:practica_obligatoria_5/src/pages/login_page.dart';
import 'package:practica_obligatoria_5/src/pages/menu_page.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import 'inicio1_page.dart';

class Inicio3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/bro.png'),
            ),
            Container(
              width: 100,
              height: 60,
              child: TextButton(
                child: Text(
                  'START',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {


                  Navigator.push(context,PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: ((context, animation, animationTime, child){
                      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: animation,
                        child: child);
                    } ),
                    pageBuilder: (context, animation, animationTime) {
                      return MenuPage();
                    },
                  ));
                  
                },
              ),
            )
          ],
        )));
  }
}
