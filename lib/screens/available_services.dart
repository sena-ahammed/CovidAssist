import 'package:flutter/material.dart';

class AvailableServicesPage extends StatefulWidget {
  @override
  _AvailableServicesPageState createState() => _AvailableServicesPageState();
}

class _AvailableServicesPageState extends State<AvailableServicesPage> {
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(5.0, 10, 5.0, 0.0),
        children: <Widget>[
          getContainerOf('Oxygen Concentrators', 'dd:mm, hr:mm'),
          getContainerOf('Tablets', 'dd:mm, hr:mm'),
          getContainerOf('Funeral Services', 'dd:mm, hr:mm'),
        ],
      ),
    );
  }

  Widget getContainerOf(String heading, String status) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(10.0),
      height: 100,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10.0),
        // gradient: RadialGradient(
        //   colors: [Colors.amber[400], Colors.black12],
        //   tileMode: TileMode.repeated,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            heading,
            textScaleFactor: 2,
          ),
          Text(status),
        ],
      ),
    );
  }

  void moveToPreviousScreen() {
    Navigator.pop(context);
  }
}
