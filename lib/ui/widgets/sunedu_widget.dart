import 'package:flutter/material.dart';
import 'package:proyectopide/models/sunedo_model.dart';
import 'package:proyectopide/ui/widgets/item_date_widget.dart';
class SuneduWidget extends StatelessWidget {

  SuneduModel suneduData;
  SuneduWidget({required this.suneduData});

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Detalle de la Consulta",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ItemDataWidget(label: "Universidad", data: suneduData.Universidad),
              ItemDataWidget(
                  label: "Numero de DNI", data: suneduData.NumeroDoc),
              ItemDataWidget(label: "Grado", data: suneduData.Grado),
              ItemDataWidget(
                  label: "Fecha de Emision", data: suneduData.Fecha_emision),
              ItemDataWidget(
                  label: "Resolucion", data: suneduData.Resolucion),
              
            ],
          ),
        ],
      ),
    );
  }
}