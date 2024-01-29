class UsuarioModel{

  String Usuario;
  String Clave;
  bool Activo;
  String  id;

  UsuarioModel({
    required this.Usuario,
    required this.Clave,
    required this.Activo,
    required this.id,
    
  });

 factory UsuarioModel.fromJson(Map<String,dynamic> json) => UsuarioModel(
    Usuario: json["Usuario"],
    Clave:json["Clave"] ,
    Activo: json["Activo"],
    id: json["id"],
    
    );

}