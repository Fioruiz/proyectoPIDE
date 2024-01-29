class PjModel{

  String Condicion;
  String  Nombres;
  String NumeroDoc;


  PjModel({
    required this.Condicion,
    required this.Nombres,

    required this.NumeroDoc,
    
  });

  
    factory PjModel.fromJson(Map<String,dynamic> json) => PjModel(
    Condicion: json["Condicion"],
    Nombres: json["Nombres"],
    NumeroDoc: json["NumeroDoc"],
    
    );
}