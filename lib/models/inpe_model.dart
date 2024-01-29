class InpeModel{

  String Condicion;
  String  Nombres;
  String NumeroDoc;


  InpeModel({
    required this.Condicion,
    required this.Nombres,

    required this.NumeroDoc,
    
  });

  
    factory InpeModel.fromJson(Map<String,dynamic> json) => InpeModel(
    Condicion: json["Condicion"],
    Nombres: json["Nombres"],
    NumeroDoc: json["NumeroDoc"],
    
    );
}