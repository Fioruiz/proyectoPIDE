import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectopide/models/servicio_model.dart';
import 'package:proyectopide/models/usuario_model.dart';
import 'package:proyectopide/ui/widgets/item_servicios_widget.dart';

class ServiciosPage extends StatefulWidget {
  @override
  State<ServiciosPage> createState() => _ServiciosPageState();
  UsuarioModel usuarioModel;
  ServiciosPage({required this.usuarioModel});
}

class _ServiciosPageState extends State<ServiciosPage> {
  List services = [];
  List<ServicioModel> myListServicios = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataServicios();
  }

  getDataServicios() async {
    Uri _wsServicios =
        Uri.parse("https://6507043d3a38daf4803effb2.mockapi.io/pide/SERVICIOS");
    http.Response response = await http.get(_wsServicios);
    if (response.statusCode == 200) {
      services = json.decode(response.body);
      services.forEach((element) {
        ServicioModel sw = ServicioModel.fromJson(element);
        myListServicios.add(sw);
      });

      //print(myListServicios);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/9/97/Escudo_nacional_del_Per%C3%BA.png"),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    offset: Offset(4, 4),
                                    blurRadius: 12.0)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "PLATAFORMA DE INTEROPERABILIDAD DEL ESTADO",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 1,
                      children: myListServicios
                          .map((e) => ItemServiciosWidget(servicioModel: e))
                          .toList()),
                ],
              ),
            )),
          )),
    );
  }
}
