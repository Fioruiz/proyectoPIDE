import 'package:flutter/material.dart';
import 'package:proyectopide/models/reniec_model.dart';
import 'package:proyectopide/ui/widgets/item_date_widget.dart';

class ReniecWidget extends StatelessWidget {

  ReniecModel reniecData;
  ReniecWidget({required this.reniecData});

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
                  label: "Numero de DNI", data: reniecData.NumeroDoc),
              ItemDataWidget(label: "Nombre", data: reniecData.Nombres),
              ItemDataWidget(
                  label: "Apellido Paterno", data: reniecData.ApellidoPaterno),
              ItemDataWidget(
                  label: "Apellido Materno", data: reniecData.ApellidoMaterno),
              ItemDataWidget(
                  label: "Sexo",
                  data: reniecData.Sexo == "M" ? "MASCULINO" : "FEMENINO"),
              ItemDataWidget(label: "Sunedu", data: "Fiorela Ruiz"),
            ],
          ),
        ],
      ),
    );
  }
}
