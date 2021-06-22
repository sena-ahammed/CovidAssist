import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 50.0),
        children: <Widget>[
          casesUntilNow(),
          beds(),
          vaccines(),
          availableServices(),
          helplineNumbers(),
        ],
      ),
    );
  }

  Widget casesUntilNow() {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1st Column element.
          Text(
            'Status as on dd-mm-yyyy hr:mm',
            textScaleFactor: 1.4,
          ),
          SizedBox(height: 10.0),
          // 2nd Column element.
          getCasesContainers(),
        ],
      ),
    );
  }

  Widget beds() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        // padding: EdgeInsets.all(10.0),
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/bed1.jpg',
                // height: 360,
                fit: BoxFit.cover,
              ),
            ),
            DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[
                    Colors.blue[800],
                    Colors.transparent,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment(0.0, 0.80),
                child: Text(
                  'Covid-19 Beds',
                  textScaleFactor: 1.8,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        navigateToNextScreen('/beds', 'Beds');
      },
    );
  }

  Widget vaccines() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        // padding: EdgeInsets.all(10.0),
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/vaccine4.jpg',
                // height: 360,
                fit: BoxFit.cover,
              ),
            ),
            DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[
                    Colors.blue[800],
                    Colors.transparent,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment(0.0, 0.80),
                child: Text(
                  'Vaccines Availability',
                  textScaleFactor: 1.8,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        navigateToNextScreen('/vaccineDetails', 'Vaccines');
      },
    );
  }

  Widget availableServices() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        // padding: EdgeInsets.all(10.0),
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/services5.jpg',
                // height: 360,
                fit: BoxFit.fill,
              ),
            ),
            DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[
                    Colors.blue[800],
                    Colors.transparent,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment(0.0, 0.80),
                child: Text(
                  'Covid-19 Available Services',
                  textScaleFactor: 1.8,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        navigateToNextScreen('/availableServices', 'Available Services');
      },
    );
  }

  Widget helplineNumbers() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        // padding: EdgeInsets.all(10.0),
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'images/helpline2.png',
                // height: 360,
                fit: BoxFit.contain,
              ),
            ),
            DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[
                    Colors.blue[800],
                    Colors.transparent,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment(0.0, 0.80),
                child: Text(
                  'Covid-19 Helpline Numbers',
                  textScaleFactor: 1.8,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        navigateToNextScreen('/helplineNumbers', 'Helpline Numbers');
      },
    );
  }

  Widget getCasesContainers() {
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
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Active Cases',
                  textScaleFactor: 1.2,
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                Text(
                  '1,30,872',
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
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Deaths',
                  textScaleFactor: 1.2,
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                Text(
                  '33,763',
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
                  'Recovered',
                  textScaleFactor: 1.2,
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                Text(
                  '26,37,279',
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

  navigateToNextScreen(String routeName, String title) async {
    await Navigator.pushNamed(context, routeName, arguments: title);
  }
}
