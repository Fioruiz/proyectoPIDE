import 'package:flutter/material.dart';
import 'package:proyectopide/models/mininter_model.dart';
import 'package:proyectopide/ui/widgets/item_date_widget.dart';

class MininterWidget extends StatelessWidget {

  MininterModel mininterData;
  MininterWidget({required this.mininterData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  label: "Numero de DNI", data: mininterData.NumeroDoc),
              ItemDataWidget(label: "Nombres", data: mininterData.Nombres),
              ItemDataWidget(
                  label: "Condicion", data: mininterData.Condicion),
              ItemDataWidget(
                  label: "# Denuncias", data: mininterData.Denuncias.toString()),
          
            ],
          ),
        ],
      ),
    );
  }
}
