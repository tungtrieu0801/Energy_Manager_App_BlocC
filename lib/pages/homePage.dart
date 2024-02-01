import 'package:flutter/material.dart';

import '../util/smart_device_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List mySmartDevice = [
    ["Smart Light", "lib/icons/air-conditioner.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
    ["Smart Light", "lib/icons/light-bub.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
  ];
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width*0.1, vertical: screenSize.height*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: screenSize.height*0.05,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: screenSize.height*0.05,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.14,vertical: screenSize.height*0.02),
              child: Column(
                children: [
                  Text(
                    "Smart Application",
                    style: TextStyle(fontSize: screenSize.height*0.04),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height*0.03,),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width*0.09,bottom: screenSize.height*0.02),
              child: Row(
                children: [
                  Text("Smart device", style: TextStyle(fontSize: screenSize.height*0.023))
                ],
              ),
            ),
            Center(
              child: Container(
                color: Colors.black,
                width: screenSize.height*0.4,
                height: 0.2,
              ),
            ),
            SizedBox(height: screenSize.height*0.02,),
            Expanded(
              child: GridView.builder(
                  itemCount: mySmartDevice.length,
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    childAspectRatio: 1/1.3
                  ),
                  itemBuilder: (context, index) {
                    return SmartDeviceSmart(
                      name: mySmartDevice[index][0],
                      path: mySmartDevice[index][1],
                      powerOn: mySmartDevice[index][2],
                      onChanged: (value) => powerSwitchChanged(value,index),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
