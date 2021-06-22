import 'package:demo_ca/screens/home.dart';
import 'package:demo_ca/screens/available_services.dart';
import 'package:demo_ca/screens/bed_details.dart';
import 'package:demo_ca/screens/beds.dart';
import 'package:demo_ca/screens/helpline_numbers.dart';
import 'package:demo_ca/screens/vaccine_details.dart';

import 'package:flutter/material.dart';

class CovidAssistanceApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      title: 'Covid Assistance',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.blueGrey[50],
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(title: 'Covid Assist'),
        '/availableServices': (context) => AvailableServicesPage(),
        '/beds': (context) => BedsPage(),
        '/helplineNumbers': (context) => HelplineNumbersPage(),
        '/bedDetails': (context) => BedsDetailPage(),
        '/vaccineDetails': (context) => VaccineDetailsPage(),
      },
    );
  }
}
