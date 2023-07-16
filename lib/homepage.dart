import 'package:flutter/material.dart';

import 'device_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final color = Colors.grey[800];
  //devices list
  List myDevices = [
    //[ DeviceName, IconPath, Status]
    ['smart light', 'assets/images/light-bulb.png', false],
    ['Smart AC', 'assets/images/air-conditioner.png', true],
    ['Smart TV', 'assets/images/smart-tv.png', false],
    ['Smart fan', 'assets/images/fan.png', true],
  ];
  //tracking of devices changes
  void onSmartSateChanged(bool value, int index){
    setState(() {
      myDevices[index][2]=value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/menu.png',
                    height: 50,
                    color: color,
                  ),
                     Icon(
                      Icons.person,
                      size: 50,
                      color: color,
                    ),
                  
                ]),
          ),
          //gap
          const SizedBox(height: 8),
          //welcome text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Home,',
                  style: TextStyle(color: color),
                ),
                Text(
                  'Rigobert DITOMA',
                  style: TextStyle(color: color, fontSize: 36),
                ),
              ],
            ),
          ),
          //Smart devices
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:45.0),
            child: Text("Smart devices", style: TextStyle(color: color, fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:45.0, vertical: 10),
            child: Divider(thickness: 1,color: Colors.grey[800]),
          ),
          const SizedBox(height: 5),
          Expanded(
              child: GridView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: myDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //this line is meant to lenghten the container, it will loose it's square shape
                    childAspectRatio: 1/1.1,
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return DeviceContainer(
                      imagePath: myDevices[index][1],
                      deviceName: myDevices[index][0],
                      powerCheck: myDevices[index][2], 
                      onChanged: (value) => onSmartSateChanged(value, index),
                    );
                  }))),
                
        ]),
      ),
    );
  }
}
