import 'package:flutter/material.dart';

class BedsPage extends StatefulWidget {
  @override
  _BedsPageState createState() => _BedsPageState();
}

class _BedsPageState extends State<BedsPage> {
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
          beds(),
          oxygenBeds(),
          icuBeds(),
          icuBedsWithVentilators(),
        ],
      ),
    );
  }

  Widget beds() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1st Column element.
            Text(
              'COVID-19 Beds ->',
              textScaleFactor: 1.4,
            ),
            SizedBox(height: 10.0),
            // 2nd Column element.
            getContainers(2500, 2000, 500),
          ],
        ),
      ),
      onTap: () {
        navigateToDetailsPage('/bedDetails', 'COVID-19 Beds');
      },
    );
  }

  Widget oxygenBeds() {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1st Column element.
              Text(
                'COVID-19 Oxygen Beds ->',
                textScaleFactor: 1.4,
              ),
              SizedBox(height: 10.0),
              // 2nd Column element.
              getContainers(1000, 800, 200),
            ],
          ),
        ),
        onTap: () {
          navigateToDetailsPage('/bedDetails', 'Covid-19 Oxygen Beds');
        });
  }

  Widget icuBeds() {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1st Column element.
              Text(
                'COVID-19 ICU Beds ->',
                textScaleFactor: 1.4,
              ),
              SizedBox(height: 10.0),
              // 2nd Column element.
              getContainers(1500, 1400, 100),
            ],
          ),
        ),
        onTap: () {
          navigateToDetailsPage('/bedDetails', 'Covid-19 ICU Beds');
        });
  }

  Widget icuBedsWithVentilators() {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1st Column element.
              Text(
                'COVID-19 ICU Beds With Ventilators->',
                textScaleFactor: 1.4,
              ),
              SizedBox(height: 10.0),
              // 2nd Column element.
              getContainers(1000, 950, 50),
            ],
          ),
        ),
        onTap: () {
          navigateToDetailsPage(
              '/bedDetails', 'Covid-19 ICU Beds With Ventilators');
        });
  }

  Widget getContainers(int total, int occupied, int vacant) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // 1st Container.
        Expanded(
          child: Container(
            // padding: EdgeInsets.all(20.0),
            // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Total',
                  textScaleFactor: 1.2,
                ),
                Text(
                  "$total",
                  textScaleFactor: 1.4,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.0),
        // 2nd Container.
        Expanded(
          child: Container(
            // padding: EdgeInsets.all(20.0),
            // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Occupied',
                  textScaleFactor: 1.2,
                ),
                Text(
                  "$occupied",
                  textScaleFactor: 1.4,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.0),
        // 3rd Container.
        Expanded(
          child: Container(
            // padding: EdgeInsets.all(20.0),
            // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.greenAccent[400],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Vacant",
                  textScaleFactor: 1.2,
                ),
                Text(
                  '2222',
                  textScaleFactor: 1.4,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  navigateToDetailsPage(String routeName, String title) async {
    await Navigator.pushNamed(context, routeName, arguments: title);
  }

  void moveToPreviousScreen() {
    Navigator.pop(context);
  }
}
