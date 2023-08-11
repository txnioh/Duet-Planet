import 'package:flutter/material.dart';
import 'package:practica_obligatoria_5/src/providers/game_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/fancy_button.dart';

class Planeta {
  bool pareja;
  String nombre;
  int id;
  String descripcion;
  bool flipped;

  Planeta(
      {required this.pareja,
      required this.nombre,
      required this.id,
      required this.descripcion,
      required this.flipped});
}

int previousIndex = 0;
int primeraYSegunda = 1;


class ManualGamePage extends StatefulWidget {
  @override
  State<ManualGamePage> createState() => _ManualGamePageState();
}

class _ManualGamePageState extends State<ManualGamePage> {
  @override
  Widget build(BuildContext context) {

    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
           decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/videos/background.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
                
            Stack(
              children: [
                 
                 
                Center(
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Image(image: AssetImage('assets/images/spaceArcade.png')),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top:50, left: 20, right: 20),
                            child: GridView.builder(
                              shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                itemCount: gameProvider.planetas.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: gameProvider.isLoading
                                        ? null
                                        : () {
                                            gameProvider.gameLogic(index);

                                          },
                                    child: (gameProvider.planetas[index].flipped)
                                        ? AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastOutSlowIn,
                                          child: Container(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              child: Image(
                                                image: NetworkImage(gameProvider.planetas[index].imagen),
                                                fit: BoxFit.cover,
                                                color: Color.fromARGB(135, 151, 151, 151),
                                                colorBlendMode: BlendMode.darken),
                                            ),
                                        )
                                        : AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastOutSlowIn,
                                          child: Container(
                                              color: Color.fromARGB(255, 194, 194, 194),
                                              child: Image(
                                                image: AssetImage('assets/cards/darkHole.jpg'),
                                                fit: BoxFit.cover,
                                                color: Color.fromARGB(135, 151, 151, 151),
                                                colorBlendMode: BlendMode.darken),
                                            ),
                                        ),
                                  );
                                })),
                                SizedBox(height: 60,),
                                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: FancyButton(
                        child: Center(
                          child: Icon(Icons.arrow_back, color: Colors.black,),
                        ),
                        size: 20,
                        color: Color.fromARGB(255, 239, 200, 57),
                        onPressed: ()  {
                          
                          gameProvider.planetasDescubiertos = [];
                          Navigator.pushNamed(context, 'menu');

                        },
                      ),
                     ),
                     Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FancyButton(
                    child: Container(height: 30,child: Image( image: AssetImage('./assets/images/planetdex.png'),)),
                    size: 20,
                    color: Color.fromARGB(255, 239, 200, 57),
                    onPressed: () {
                      Navigator.pushNamed(context, 'planetdexgrid');
                    },
                  ),
                ),
                   ],
                 ),
                      ],
                    )
                    ),
                            (gameProvider.win) ? 
        
          AlertDialog(
              content: Container(
                height: 500,
                child: Text('Has encontrado todas las parejas.')),
              actions: <Widget>[
                FancyButton(
                    child: Center(
                      child: Text("SAVE"),
                    ),
                    size: 20,
                    color: Color.fromARGB(255, 239, 200, 57),
                    onPressed: () {
                    gameProvider.win = false;
                    Navigator.pushNamed(context, 'login');
                  },
                  ),
                  SizedBox(width: 80,)
                
              ],
            ) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


