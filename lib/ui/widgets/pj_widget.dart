import 'package:flutter/material.dart';
import 'package:proyectopide/models/pj_model.dart';
import 'package:proyectopide/ui/widgets/item_date_widget.dart';

class PjWidget extends StatelessWidget {

  PjModel pjData;
  PjWidget({required this.pjData});

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
              ItemDataWidget(
                  label: "Numero de DNI", data: pjData.NumeroDoc),
              ItemDataWidget(label: "Nombres", data: pjData.Nombres),
              ItemDataWidget(
                  label: "Condicion", data: pjData.Condicion),
           
            ],
          ),
        ],
      ),
    );
  }
}
