class ReniecModel{


  String Nombres;
  String ApellidoPaterno;
  String  ApellidoMaterno;
  String Sexo;
  String Foto;

  String NumeroDoc;


  ReniecModel({
    required this.Nombres,
    required this.ApellidoPaterno,
    required this.ApellidoMaterno,
    required this.Sexo,
    required this.Foto,
    required this.NumeroDoc,
    
  });

  
    factory ReniecModel.fromJson(Map<String,dynamic> json) => ReniecModel(
    Nombres: json["Nombres"],
    ApellidoPaterno:json["ApellidoPaterno"] ,
    ApellidoMaterno: json["ApellidoMaterno"],
    Sexo: json["Sexo"], 
    Foto: json["Foto"],
    NumeroDoc: json["NumeroDoc"],
    
    );
}