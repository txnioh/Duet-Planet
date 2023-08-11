import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/fancy_button.dart';


class MenuPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

  final gameProvider = Provider.of<GameProvider>(context);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/videos/background.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FancyButton(
                  child: Center(
                    child: Image(image: AssetImage('assets/arcade/game.png'), width: 120,),
                  ),
                  size: 80,
                  color: Color.fromARGB(255, 69, 69, 69),

                  onPressed: () async {

                    await gameProvider.getPlanetas();

                    Navigator.pushNamed(context, 'game');
                  },
                ),
              SizedBox(height: 40,),
              FancyButton(
                  child: Center(
                    child: Image(image: AssetImage('assets/arcade/ranking.png'), width: 120,),
                  ),
                  size: 80,
                  color: Color.fromARGB(255, 69, 69, 69),

                  onPressed: () async {
                    
                    gameProvider.getJugadores();

                    Navigator.pushNamed(context, 'ranking');

                  },
                ),
              SizedBox(height: 40,),
              FancyButton(
                  child: Center(
                    child: Image(image: AssetImage('assets/arcade/aprende.png'), width: 120,),
                  ),
                  size: 80,
                  color: Color.fromARGB(255, 69, 69, 69),


                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}