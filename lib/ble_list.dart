import 'package:bluetooth/ble_model.dart';
import 'package:bluetooth/devices_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class BleListPage extends StatefulWidget {
  @override
  _BleListPageState createState() => _BleListPageState();
}

class _BleListPageState extends State<BleListPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<Device> foundDevices = List<Device>();
  Device deviceBefore = Device();
  List devices = List();

  @override
  void initState() {
    scanIt();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Devices List'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            scanIt();
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 2000,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF01afbd).withOpacity(0.9),
              Colors.blue[800].withOpacity(0.8)
            ])),
            child: Column(
              children: [
                SizedBox(height: _height * 0.08),
                for (var item in foundDevices)
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(DeviceDetailPage(
                            name: item.deviceName,
                            id: item.deviceId,
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(item.deviceName,
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 0.8,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: _height * 0.02),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }

  void scanIt() {
    setState(() {
      foundDevices.clear();
    });
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! ${r.device.id} ');
        if (r.device.name == '' || r.device.name == ' ') {
          deviceBefore.deviceName = 'Device has no name!';
          deviceBefore.deviceId = r.device.id.toString();

          setState(() {
            foundDevices.add(deviceBefore);
          });
        } else {
          deviceBefore.deviceName = r.device.name;
          deviceBefore.deviceId = r.device.id.toString();
          setState(() {
            foundDevices.add(deviceBefore);
          });
        }
      }
    });

// Stop scanning
    flutterBlue.stopScan();
  }
}
