import 'package:flutter/material.dart';
import 'package:proyectopide/models/inpe_model.dart';
import 'package:proyectopide/ui/widgets/item_date_widget.dart';

class InpeWidget extends StatelessWidget {

  InpeModel inpeData;
  InpeWidget({required this.inpeData});

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
                  label: "Numero de DNI", data: inpeData.NumeroDoc),
              ItemDataWidget(label: "Nombres", data: inpeData.Nombres),
              ItemDataWidget(
                  label: "Condicion", data: inpeData.Condicion),
          
            ],
          ),
        ],
      ),
    );
  }
}
