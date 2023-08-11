import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';


class InfoPlanetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              background:  Image(image: NetworkImage(gameProvider.planetaElegido.imagen.toString()), fit: BoxFit.fill)
            ),
          ),
            SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              ])
          )
        ],
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
      final gameProvider = Provider.of<GameProvider>(context);

    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  Center(
                child: Column(
                children: [
                  Text(
                    gameProvider.planetaElegido.nombre,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 300,),
                  Text(
                    gameProvider.planetaElegido.descripcion,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
                          ),
              ),
          
    );
  }
}