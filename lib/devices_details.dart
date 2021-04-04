import 'package:flutter/material.dart';

class DeviceDetailPage extends StatelessWidget {
  final String name;
  final String id;
  DeviceDetailPage({this.name, this.id});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Device Detail'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF01afbd).withOpacity(0.9),
            Colors.blue[800].withOpacity(0.8)
          ])),
          child: Column(
            children: [
              SizedBox(height: _height * 0.08),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Device Name:',
                          style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 0.8,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: _height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 0.8,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: _height * 0.15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Device ID:',
                          style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 0.8,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: _height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(id,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 0.8,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: _height * 0.02),
                ],
              ),
            ],
          ),
        ));
    ;
  }
}
