import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/fancy_button.dart';


class RankingPage extends StatelessWidget {

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
      child: (gameProvider.jugadores != []) ? Column(
        children: [
                      SizedBox(height: 80,),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(), //Added physics
                child: Container(
                  height: 500,
                  child: ListView.builder(
                  itemCount: gameProvider.jugadores.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final jugador = gameProvider.jugadores[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(104, 100, 100, 100)
                        ),
                        child: ListTile(
                          leading: Icon(Icons.all_inclusive),
                          title: Text(jugador.name),
                          subtitle: Text("Voids: ${jugador.errors}"),
                        ),
                      ),
                    ); 
                  },
                    ),
                ),
              ),
            ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: FancyButton(
                  child: Center(
                    child: Icon(Icons.arrow_back, color: Colors.black,),
                  ),
                  size: 20,
                  color: Color.fromARGB(255, 239, 200, 57),
                            
                  onPressed: ()  {
               
               
                    Navigator.pushNamed(context, 'menu');
                            
                  },
                             ),
               ),
        ],
      ) : Container(child: Text('cargando..'),)

   ));
  }
}