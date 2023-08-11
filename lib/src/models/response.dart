// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromMap(jsonString);

import 'dart:convert';

import 'package:practica_obligatoria_5/src/models/planeta.dart';

PopularResponse popularResponseFromMap(String str) => PopularResponse.fromMap(json.decode(str));

String popularResponseToMap(PopularResponse data) => json.encode(data.toMap());

class PopularResponse {
    PopularResponse({
        required this.planetas,
    });

    List<Planeta> planetas;

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        planetas: List<Planeta>.from(json["planetas"].map((x) => Planeta.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "planetas": List<dynamic>.from(planetas.map((x) => x.toMap())),
    };
}
