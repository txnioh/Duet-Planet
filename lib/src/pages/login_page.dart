import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text;
                  gameProvider.createJugador(name, gameProvider.errors);
                  gameProvider.errors = 0;
                  Navigator.pushNamed(context, 'principal');
                },
                child: Text('Jugar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}