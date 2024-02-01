import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceSmart extends StatelessWidget {
  final String name;
  final String path;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceSmart({
    super.key,
    required this.name,
    required this.path,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screen.height*0.01),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screen.height*0.03),
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
        ),
        padding: EdgeInsets.symmetric(vertical: screen.height*0.05),
        child: InkWell(
          onTap: () {
            // Điều này sẽ thực hiện khi bạn nhấn vào cả hình ảnh và văn bản
            if (onChanged != null) {
              onChanged!(!powerOn);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                path,
                height: 65,
                color: powerOn?Colors.white:Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: screen.width*0.06),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screen.height*0.022,
                          color: powerOn ? Colors.white : Colors.black
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
