import 'package:flutter/material.dart';
import 'package:flutter_ui_smart_home_app/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Padding constants
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  // Smart Devices List
  List mySmartDevices = [
    // [smartDeviceName, iconPath, powerStatus]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", true],
  ];

  // Power Button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Custom App Bar
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Menu Icon
                Image.asset(
                  'lib/icons/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),

                // Account Icon
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // Welcome Home User Text
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Home",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  "User!",
                  style: TextStyle(
                    fontSize: 72,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),

          const SizedBox(
            height: 50,
          ),

          // Smart Devices Grid
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Text(
              "Smart Devices",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(25),
              itemCount: mySmartDevices.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  iconPath: mySmartDevices[index][1],
                  smartDeviceName: mySmartDevices[index][0],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
