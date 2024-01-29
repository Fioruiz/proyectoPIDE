import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectopide/models/usuario_model.dart';
import 'package:proyectopide/pages/servicios_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = "PLATAFORMA DE INTEROPERABILIDAD DEL ESTADO";

  final usuarioText = TextEditingController();
  final passText = TextEditingController();
  bool val =false;
  List services = [];
  List<UsuarioModel> myListUsuarios = [];
  late  UsuarioModel usuarioModel;
  String subtitulo = "Servicios PIDE";
  // URI
 
  getDataUsuario() async {
     Uri _wsUsuario =
      Uri.parse("https://6507043d3a38daf4803effb2.mockapi.io/pide/LOGIN");
    http.Response response = await http.get(_wsUsuario);
    if (response.statusCode == 200) {
      services = json.decode(response.body);
      services.forEach((element) {
        UsuarioModel sw = UsuarioModel.fromJson(element);
        myListUsuarios.add(sw);
      });
      usuarioModel = myListUsuarios[0];
      print(myListUsuarios);
       if(usuarioModel.Usuario==usuarioText.text && usuarioModel.Clave==passText.text){
        print("hola");
        val=true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(240, 243, 244, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(top: 80, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/9/97/Escudo_nacional_del_Per%C3%BA.png"),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        titulo,
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 25.0,
                          fontFamily: "Lobster",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        subtitulo,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                    Theme(
                      data: new ThemeData(
                        hintColor: Colors.grey,
                        cardColor: Colors.grey,
                        dividerColor: Colors.grey,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.grey),
                        controller: usuarioText,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            icon: Icon(Icons.person),
                            labelText: 'Ingresa tu usuario',
                            focusColor: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Theme(
                      data: new ThemeData(
                        hintColor: Colors.grey,
                        cardColor: Colors.grey,
                        dividerColor: Colors.grey,
                      ),
                      child: TextField(
                        controller: passText,
                        style: TextStyle(color: Colors.grey),
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            icon: Icon(Icons.password),
                            labelText: 'Ingresa tu password',
                            focusColor: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                        ),
                        onPressed: () {
                          getDataUsuario();
                          if(val)
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> ServiciosPage(usuarioModel: usuarioModel)));
                          setState(() {});
                        },
                        child: Text(
                          "INGRESAR",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
