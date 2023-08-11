import 'package:flutter/material.dart';
import 'package:practica_obligatoria_5/src/pages/game_manual_page.dart';
import 'package:practica_obligatoria_5/src/pages/info_planet.dart';
import 'package:practica_obligatoria_5/src/pages/inicio1_page.dart';
import 'package:practica_obligatoria_5/src/pages/inicio2_page.dart';
import 'package:practica_obligatoria_5/src/pages/inicio3_page.dart';
import 'package:practica_obligatoria_5/src/pages/login_page.dart';
import 'package:practica_obligatoria_5/src/pages/menu_page.dart';
import 'package:practica_obligatoria_5/src/pages/planetdex_grid_page.dart';
import 'package:practica_obligatoria_5/src/pages/planetdex_page.dart';
import 'package:practica_obligatoria_5/src/pages/principal_page.dart';
import 'package:practica_obligatoria_5/src/pages/ranking_page.dart';
import 'package:practica_obligatoria_5/src/providers/game_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {

   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  ]);

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: const MaterialAppTheme(),
    );

 
  
  }
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

        title: 'Practica Obligatoria 5',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: 'principal',
        routes: {
          'inicio1': (_) => Inicio1Page(), 
          'inicio2': (_) => Inicio2Page(),
          'inicio3': (context) => Inicio3Page(),
          'login': (context) => LoginPage(),
          'principal': (context) => PrincipalPage(),
          'game': (context) => ManualGamePage(),
          'menu': (context) => MenuPage(),
          'ranking': (context) => RankingPage(),
          'planetdex': (context) => PlanetDexPage(),
          'planetdexgrid': (context) => PlanetDexGridPage(),
          'infoplanet': (context) => InfoPlanetPage(),
        }

      );
  }
}
