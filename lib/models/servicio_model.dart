import 'package:json_annotation/json_annotation.dart';


class ServicioModel{

  String Descripcion;
  String Metodo;
  String Entidad;
  String  Logo;
  String  id;

  ServicioModel({
    required this.Descripcion,
    required this.Metodo,
    required this.Entidad,
    required this.Logo,
    required this.id,
    
  });

  factory ServicioModel.fromJson(Map<String,dynamic> json) => ServicioModel(
    Descripcion: json["Descripcion"],
    Metodo:json["Metodo"] ,
    Entidad: json["Entidad"],
    Logo: json["Logo"], 
    id: json["id"],
    
    );
}