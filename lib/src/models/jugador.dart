
class Jugador {
  final String name;
  final int errors;

  Jugador({required this.name, required this.errors});

  factory Jugador.fromJson(Map<String, dynamic> json) {
    return Jugador(
      name: json['name'],
      errors: json['errors'],
    );
  }
}