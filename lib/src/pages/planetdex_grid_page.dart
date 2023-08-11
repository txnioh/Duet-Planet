import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/fancy_button.dart';


class PlanetDexGridPage extends StatelessWidget {

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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image(image: AssetImage('assets/arcade/game.png')),
                )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 150, bottom: 120, left: 30, right: 30),
              child: GridView.builder(
                shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0,
              ),
              itemCount: gameProvider.planetas2.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    gameProvider.planetaElegido = gameProvider.planetas2[index];
                    Navigator.pushNamed(context, 'infoplanet');
                  },
                  child: (gameProvider.planetas2[index].pareja) ? Container(
                   color: Color.fromARGB(255, 0, 0, 0),
                   child: Image(
                     image: NetworkImage(gameProvider.planetas2[index].imagen),
                     fit: BoxFit.cover,
                     color: Color.fromARGB(135, 151, 151, 151),
                     colorBlendMode: BlendMode.darken),
                 ): Container(color: Colors.black, child: Center(child: Image(image: AssetImage('./assets/images/panetWhite.png'),)),)
                );
              }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 150,
                  child: Center(
                       child: FancyButton(
                      child: Center(
                        child: Text("Exit"),
                      ),
                      size: 40,
                      color: Color.fromARGB(255, 239, 200, 57),
                      onPressed: () {
                      gameProvider.win = false;
                      Navigator.pop(context);
                    },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
   );
  }
}