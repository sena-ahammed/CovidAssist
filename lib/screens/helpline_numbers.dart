import 'package:flutter/material.dart';

class HelplineNumbersPage extends StatefulWidget {
  @override
  _HelplineNumbersPageState createState() => _HelplineNumbersPageState();
}

class _HelplineNumbersPageState extends State<HelplineNumbersPage> {
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text('Status as on dd-mm-yyyy hr:mm'),
            ),
          ],
        ),
      ),
    );
  }

  void moveToPreviousScreen() {
    Navigator.pop(context);
  }
}
