import 'package:flutter/material.dart';
import 'package:proyectopide/models/inpe_model.dart';
import 'package:proyectopide/models/mininter_model.dart';
import 'package:proyectopide/models/pj_model.dart';
import 'package:proyectopide/models/reniec_model.dart';
import 'package:proyectopide/models/servicio_model.dart';
import 'package:proyectopide/models/sunedo_model.dart';
import 'package:proyectopide/ui/general/colors.dart';
import 'package:proyectopide/ui/widgets/inpe_widget.dart';
import 'package:proyectopide/ui/widgets/item_date_widget.dart';
import 'package:http/http.dart' as http;
import 'package:proyectopide/ui/widgets/mininter_widget.dart';
import 'package:proyectopide/ui/widgets/pj_widget.dart';
import 'dart:convert';

import 'package:proyectopide/ui/widgets/reniec_widget.dart';
import 'package:proyectopide/ui/widgets/sunedu_widget.dart';

class DetailPage extends StatefulWidget {
  ServicioModel servicioModel;

  DetailPage({required this.servicioModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final dni = TextEditingController();
  dynamic service;
  late ReniecModel reniecData;
  late SuneduModel suneduData;
  late MininterModel mininterData;
  late InpeModel inpeData;
  late PjModel pjData;
  bool isVisibleReniec = false;
  bool isVisibleSunedu = false;
  bool isVisibleMininter = false;
  bool isVisibleInpe = false;
  bool isVisiblePj = false;

  getDataUsuario() async {
    print(dni.text);
    //CONSULTA A RENIEC
    if (widget.servicioModel.id == "1") {
      Uri _wsRENIEC = Uri.parse(
          "https://65b5657f41db5efd2867ad4e.mockapi.io/pide/RENIEC/" +
              dni.text);
      print(_wsRENIEC);
      http.Response response = await http.get(_wsRENIEC);
      if (response.statusCode == 200) {
        isVisibleReniec = true;
        service = json.decode(response.body);
        reniecData = ReniecModel.fromJson(service);
      } else {
        isVisibleReniec = false;
      }
    }
    //consulta MININTER
    if (widget.servicioModel.id == "2") {
      Uri _wsMININTER = Uri.parse(
          "https://65b6a0feda3a3c16ab0100be.mockapi.io/pide/MININTER/" +
              dni.text);
      print(_wsMININTER);
      http.Response responseMininter =
          await http.get(_wsMININTER, headers: {"charset": "UTF-8"});
      if (responseMininter.statusCode == 200) {
        isVisibleMininter = true;
        service = json.decode(responseMininter.body);
        mininterData = MininterModel.fromJson(service);
      } else {
        isVisibleMininter = false;
      }
    }
    //consulta INPE
    if (widget.servicioModel.id == "3") {
      Uri _wsINPE = Uri.parse(
          "https://65b6a0feda3a3c16ab0100be.mockapi.io/pide/INPE/" + dni.text);
      print(_wsINPE);
      http.Response responseInpe =
          await http.get(_wsINPE, headers: {"charset": "UTF-8"});
      if (responseInpe.statusCode == 200) {
        isVisibleInpe = true;
        service = json.decode(responseInpe.body);
        inpeData = InpeModel.fromJson(service);
      } else {
        isVisibleInpe = false;
      }
    }
    //consulta PJ
    if (widget.servicioModel.id == "4") {
      Uri _wspj = Uri.parse(
          "https://65b6a6b9da3a3c16ab0108d1.mockapi.io/pide/PODERJUDICIAL/" +
              dni.text);
      print(_wspj);
      http.Response responsePJ = await http.get(_wspj);
      if (responsePJ.statusCode == 200) {
        isVisiblePj = true;
        service = json.decode(responsePJ.body);
        pjData = PjModel.fromJson(service);
      } else {
        isVisiblePj = false;
      }
    }

    //consulta SUNEDU
    if (widget.servicioModel.id == "5") {
      Uri _wsSUNEDU = Uri.parse(
          "https://65b5657f41db5efd2867ad4e.mockapi.io/pide/SUNEDU/" +
              dni.text);
      print(_wsSUNEDU);
      http.Response responseSunedu = await http.get(_wsSUNEDU);
      if (responseSunedu.statusCode == 200) {
        isVisibleSunedu = true;
        service = json.decode(responseSunedu.body);
        suneduData = SuneduModel.fromJson(service);
      } else {
        isVisibleSunedu = false;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorsEntidad[widget.servicioModel.Entidad],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text(
                  widget.servicioModel.Metodo,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Theme(
                  data: new ThemeData(
                    hintColor: Colors.white,
                    cardColor: Colors.white,
                    dividerColor: Colors.white,
                    highlightColor: Colors.white,
                  ),
                  child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      controller: dni,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.credit_card),
                        labelText: 'Ingrese el DNI',
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        prefixIconColor: Colors.white,
                        suffixIconColor: Colors.white,
                        iconColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                      onPressed: () {
                        getDataUsuario();
                        //setState(() {});
                      },
                      child: Text(
                        "CONSULTAR",
                        style: TextStyle(
                            fontSize: 20,
                            color: colorsEntidad[widget.servicioModel.Entidad]),
                      )),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(flex: 5, child: SizedBox()),
              Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              if (isVisibleReniec)
                                ReniecWidget(reniecData: reniecData),
                              if (isVisibleSunedu)
                                SuneduWidget(suneduData: suneduData),
                              if (isVisibleMininter)
                                MininterWidget(mininterData: mininterData),
                              if (isVisiblePj) PjWidget(pjData: pjData),
                              if (isVisibleInpe) InpeWidget(inpeData: inpeData),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: -60,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.white24,
                              backgroundImage:
                                  NetworkImage(widget.servicioModel.Logo),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
