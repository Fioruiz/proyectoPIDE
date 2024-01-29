class MininterModel{

  String Condicion;
  int Denuncias;
  String  Nombres;
  String NumeroDoc;


  MininterModel({
    required this.Condicion,
    required this.Denuncias,
    required this.Nombres,
    required this.NumeroDoc,
    
  });

  
    factory MininterModel.fromJson(Map<String,dynamic> json) => MininterModel(
    Condicion: json["Condicion"],
    Denuncias:json["Denuncias"] ,
    Nombres: json["Nombres"],
    NumeroDoc: json["NumeroDoc"],
    
    );
}