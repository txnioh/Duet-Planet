
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_5/src/models/jugador.dart';
import 'package:practica_obligatoria_5/src/services/planet_service.dart';

import '../models/planeta.dart';

class GameProvider with ChangeNotifier{

  PlanetService planetService = PlanetService();

  int previousIndex = 0;
  int primeraYSegunda = 1;
  bool isLoading = true;
  bool isLoadingSquare = false;
  bool isAcierto = false;

  List<Planeta> planetas = [];
  List<Planeta> planetas2 = [];
  List<Planeta> planetasDescubiertos = [];

  Planeta planetaElegido = Planeta(id: 11, nombre: "Elegido", descripcion: "aaa", flipped: false, imagen: '', pareja: false);

  Jugador? jugador;
  List<Jugador> jugadores = [];
  
  int errors = 0;

  bool win = false;


  Future<void> getPlanetas() async{

    planetas = await planetService.getPlanets();
    planetas2 = await planetService.getPlanets();

    planetas.addAll([...planetas2]);

    planetas.shuffle();

    isLoading = false;

    notifyListeners();
  }

  void gameLogic(int index) async{

      await Future.delayed(const Duration(milliseconds: 500));

      print(primeraYSegunda);
      print(index);

      if (primeraYSegunda == 1) {
        if(!planetas[index].pareja){
          if (!planetas[index].flipped) {  //No está flipped
            planetas[index].flipped = true;
            previousIndex = index;
            primeraYSegunda++;
            notifyListeners();   
          } else{
              primeraYSegunda = 1;
              notifyListeners();   

          }
        }else{
          primeraYSegunda = 1;
          notifyListeners();   
   
        }

      }else if (primeraYSegunda == 2) { //Es el segundo

      if (!planetas[index].flipped) {

          planetas[index].flipped = true;

          notifyListeners();

          if (planetas[index].id == planetas[previousIndex].id) { //Su id es igual al anterior.

          // Check if all planets are flipped
            bool allFlipped = true;

            for (var planeta in planetas) {
              if (!planeta.flipped) {
                allFlipped = false;
                break;
              }
            }

            // Show message if all planets are flipped
            if (allFlipped) {
              win = true;
              notifyListeners();
/* 
              win = false;
              notifyListeners(); */
            }


          planetas[index].flipped = true;
          planetas[index].pareja = true;
          planetas[previousIndex].pareja = true;

          planetas2.forEach((element) {
            if(element.nombre == planetas[index].nombre){
              element.pareja = true;
            }
          });

          //Agrega planeta para la DEX de planetas.

          planetasDescubiertos.add(planetas[index]);

          //Comprueba si se ha acertado, es para el showDialog de cada pareja, aun no se ha hecho.
          isAcierto = true;
          notifyListeners();
          }else{

            await Future.delayed(const Duration(milliseconds: 1000));
            
            planetas[index].flipped = false;
            planetas[previousIndex].flipped = false;
            errors++;

            notifyListeners();
          }
      }else{

          planetas[index].flipped = false;
          primeraYSegunda = 1;
          notifyListeners();   

      }
        primeraYSegunda = 1;
        notifyListeners();   

      } 
    
      
  }

  void createJugador(String name, int errors) async {

      jugador = Jugador(name: name, errors: errors );
         
      await planetService.postJugador(jugador!);
  }

  void getJugadores() async{

    jugadores = await planetService.getJugadores();

    jugadores.sort((a, b) => a.errors.compareTo(b.errors));

    notifyListeners();

  }

}