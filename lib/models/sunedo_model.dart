class SuneduModel{

  String Grado;
  String Fecha_emision;
  String Resolucion;
  String  Universidad;

  String NumeroDoc;


  SuneduModel({
    required this.Grado,
    required this.Fecha_emision,
    required this.Resolucion,
    required this.Universidad,


    required this.NumeroDoc,
    
  });

    factory SuneduModel.fromJson(Map<String,dynamic> json) => SuneduModel(
    Grado: json["Grado"],
    Fecha_emision:json["Fecha_emision"] ,
    Universidad: json["Universidad"],
    Resolucion: json["Resolucion"], 
    NumeroDoc: json["NumeroDoc"],
    
    );
}

