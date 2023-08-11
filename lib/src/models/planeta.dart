
class Planeta {
    Planeta({
        required this.pareja,
        required this.nombre,
        required this.id,
        required this.descripcion,
        required this.flipped,
        required this.imagen,
    });

    bool pareja;
    String nombre;
    int id;
    String descripcion;
    bool flipped;
    String imagen;

    factory Planeta.fromMap(Map<String, dynamic> json) => Planeta(
        pareja: json["pareja"],
        nombre: json["nombre"],
        id: json["id"],
        descripcion: json["descripcion"],
        flipped: json["flipped"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toMap() => {
        "pareja": pareja,
        "nombre": nombre,
        "id": id,
        "descripcion": descripcion,
        "flipped": flipped,
        "imagen": imagen,
    };
}
