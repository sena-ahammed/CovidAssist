import 'package:demo_ca/enum/vaccine_criteria.dart';
import 'package:demo_ca/model/vaccine_details_model.dart';
import 'package:demo_ca/utils/sliver_header_delegate.dart';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

class VaccineDetailsPage extends StatefulWidget {
  @override
  _VaccineDetailsPageState createState() => _VaccineDetailsPageState();
}

class _VaccineDetailsPageState extends State<VaccineDetailsPage> {
  VaccineCriteria _criteria = VaccineCriteria.under45;

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          radioTiles(),
          tableHeader(),
          tableElements(),
        ],
      ),
    );
  }

  tableHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60.0,
        maxHeight: 80.0,
        child: Container(
          padding: EdgeInsets.all(5.0),
          color: Colors.grey,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Name',
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Text(
                  'Vaccine',
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Text(
                  'Last Updated',
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Text(
                  'Available Slots',
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(width: 5),
              // Expanded(
              //   child: Text(
              //     'Price',
              //     textScaleFactor: 1.4,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  tableElements() {
    List<VaccineModel> vaccineDetailsList = dummyData();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                color: Colors.blueGrey[50],
                child: ExpandablePanel(
                  header: Row(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          vaccineDetailsList[index].vaccinationCenter,
                          textScaleFactor: 1.4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: Text(
                          vaccineDetailsList[index].vaccine,
                          textScaleFactor: 1.4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: Text(
                          vaccineDetailsList[index].lastUpdatedStatus,
                          textScaleFactor: 1.4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${vaccineDetailsList[index].availableSlots}',
                          textScaleFactor: 1.4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // SizedBox(width: 5),
                      // Expanded(
                      //   child: Text(
                      //     '${vaccineDetailsList[index].price}',
                      //     textScaleFactor: 1.5,
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                    ],
                  ),
                  theme: ExpandableThemeData(hasIcon: false),
                  collapsed: null,
                  expanded: detailsCard(vaccineDetailsList[index]),
                ),
              ),
              // SizedBox(height: 5),
              Divider(height: 1, color: Colors.black),
            ],
          );
        },
        childCount: vaccineDetailsList.length,
      ),
    );
  }

  void moveToPreviousScreen() {
    Navigator.pop(context);
  }

  Widget radioTiles() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        minHeight: 0.0,
        maxHeight: 120.0,
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              RadioListTile<VaccineCriteria>(
                title: const Text(
                  'Under 45 (Age group 18 - 45)',
                  textScaleFactor: 1.2,
                ),
                activeColor: Colors.blue,
                value: VaccineCriteria.under45,
                groupValue: _criteria,
                onChanged: (VaccineCriteria value) {
                  setState(() {
                    _criteria = value;
                  });
                },
              ),
              RadioListTile<VaccineCriteria>(
                title: const Text(
                  'Above 45 (Age group 45+)',
                  textScaleFactor: 1.2,
                ),
                activeColor: Colors.blue,
                value: VaccineCriteria.above45,
                groupValue: _criteria,
                onChanged: (VaccineCriteria value) {
                  setState(() {
                    _criteria = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailsCard(VaccineModel details) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              details.vaccinationCenter,
              textScaleFactor: 1.4,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'aa cross, bbb road, xyz, Mysuru',
              textScaleFactor: 1.4,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: ',
                      textScaleFactor: 1.4,
                    ),
                    Text(
                      'Contact numbers: ',
                      textScaleFactor: 1.4,
                    ),
                    Text(
                      'View Location: ',
                      textScaleFactor: 1.4,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rs ${details.price}',
                      textScaleFactor: 1.4,
                    ),
                    Text(
                      '9126485236, 7823649821',
                      textScaleFactor: 1.4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.map_outlined,
                          color: Colors.green,
                          // size: 30.0,
                        ),
                        Text(
                          'Open Maps',
                          textScaleFactor: 1.4,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

List<VaccineModel> dummyData() {
  return [
    VaccineModel(
      'Columbia Asia Hospital',
      'Covishield',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
    VaccineModel(
      'Janata Covid Center',
      'Covaxin',
      '11:04 PM, Jun 06',
      60,
      30,
    ),
    VaccineModel(
      'Apollo Hospital',
      'Covaxin',
      '09:05 AM, Jun 04',
      200,
      150,
    ),
    VaccineModel(
      'Krishnagar Covid Center',
      'Covishield',
      '01:00 pM, Jun 06',
      100,
      80,
    ),
    VaccineModel(
      'Kamakshi Hospital',
      'Covishield',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
    VaccineModel(
      'Krishnagar Covid Center',
      'Covaxin',
      '01:00 pM, Jun 06',
      100,
      80,
    ),
    VaccineModel(
      'Columbia Asia Hospital',
      'Covishield',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
    VaccineModel(
      'Apollo Hospital',
      'Covishield',
      '09:05 AM, Jun 04',
      200,
      150,
    ),
    VaccineModel(
      'Kamakshi Hospital',
      'Covaxin',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
  ];
}
