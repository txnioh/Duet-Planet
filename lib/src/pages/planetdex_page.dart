import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/fancy_button.dart';

class PlanetDexPage extends StatelessWidget {
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
        child: (gameProvider.planetasDescubiertos.isNotEmpty) ? Swiper(
          itemCount: gameProvider.planetasDescubiertos.length,
          itemBuilder: (context, index) {
            final planeta = gameProvider.planetasDescubiertos[index];
            return Container(
              padding: EdgeInsets.only(top: 100),
              height: 500,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(planeta.imagen),
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      planeta.nombre,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(planeta.descripcion),
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
               
               
                    Navigator.pop(context);
                            
                  },
                             ),
               ),
                ],
              ),
            );
          },
          control: SwiperControl(),
          loop: false,
        ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("empty..."),
              SizedBox(height: 40,),
             FancyButton(
                 child: Center(
                   child: Icon(Icons.arrow_back, color: Colors.black,),
                 ),
                 size: 20,
                 color: Color.fromARGB(255, 239, 200, 57),
                 onPressed: ()  {
                   Navigator.pop(context);            
                 },
               ),
            ],
          ),
        ),
        )
    );
  }
}
