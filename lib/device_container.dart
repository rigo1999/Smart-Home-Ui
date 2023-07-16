import 'dart:math';
import 'package:flutter/material.dart';
 class DeviceContainer extends StatelessWidget {
  final String imagePath;
  final String deviceName;
  final bool powerCheck;
  final Function(bool)? onChanged;
   DeviceContainer({super.key, required this.deviceName, required this.imagePath, required this.powerCheck, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
               padding: const EdgeInsets.all(10.0),
               child: Container( 
                padding:const  EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: powerCheck? Colors.grey[900]:  Colors.grey[200], borderRadius: BorderRadius.circular(20), 
                border: Border.all(
                  color: Colors.white70
                ),
                boxShadow:const  [
                  BoxShadow(
                    color: Colors.white24,
                    offset: Offset(-1.5, -1.5),
                    blurRadius: 10.0,
                    spreadRadius: 4,
                  ),
                   BoxShadow(
                    color: Colors.white10,
                    offset: Offset(1.5, 1.5),
                    blurRadius: 10.0,
                    spreadRadius: 4,
                  )
                ]
               ),
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  //icon
                  Image.asset(imagePath, height: 65,color: powerCheck? Colors.white:Colors.black),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(deviceName,style: TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: powerCheck? Colors.white:Colors.black), )),
                          Transform.rotate(
                            angle: pi*0.5,
                            child: Switch(value: powerCheck, onChanged: onChanged))
                        ],
                      ),
                    ),
                  

                  
             
             
               ])),
             );
  }
}