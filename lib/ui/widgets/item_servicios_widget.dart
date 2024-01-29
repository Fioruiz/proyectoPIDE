import 'package:flutter/material.dart';
import 'package:proyectopide/models/servicio_model.dart';
import 'package:proyectopide/pages/detail_page.dart';
import 'package:proyectopide/ui/general/colors.dart';

class ItemServiciosWidget extends StatelessWidget {
   ServicioModel servicioModel;
  ItemServiciosWidget({
    required this.servicioModel,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(servicioModel: servicioModel,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorsEntidad[servicioModel.Entidad],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -5,
              right: -5,
              child: Image.asset(
                'assets/images/circle.png',
                height: 120.0,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Positioned(
              width: 100,
              height: 100,
              bottom: 5,
              right: 5,
              child:
                  CircleAvatar(
                  radius: 56.0,
                  backgroundColor: Colors.white24,
                  backgroundImage: NetworkImage(
                      servicioModel.Logo),
                ), 
                  
                 //  Image.network(
                //  servicioModel.Logo),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    servicioModel.Entidad,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              offset: Offset(4, 4),
                              blurRadius: 12.0)
                        ]),
                    child: Text(
                      servicioModel.Descripcion,
                      style: TextStyle(color: Colors.black45),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
