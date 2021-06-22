import 'package:demo_ca/model/bed_details_model.dart';
import 'package:demo_ca/utils/sliver_header_delegate.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class BedsDetailPage extends StatefulWidget {
  @override
  _BedsDetailPageState createState() => _BedsDetailPageState();
}

class _BedsDetailPageState extends State<BedsDetailPage> {
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          genInfo(),
          tableHeader(),
          tableElements(),
        ],
      ),
    );
  }

  genInfo() {
    return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate(
        minHeight: 0.0,
        maxHeight: 140.0,
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60.0,
                    height: 40.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        // border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    ' - More than 20 beds are available',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              SizedBox(height: 2.0),
              Row(
                children: [
                  SizedBox(
                    width: 60.0,
                    height: 40.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.amberAccent[100],
                        // border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    ' - Less than 10 beds are available',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              SizedBox(height: 2.0),
              Row(
                children: [
                  SizedBox(
                    width: 60.0,
                    height: 40.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[400],
                        // border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    ' - No beds are available',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
            ],
          ),
        ),
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Hospital/Covid Centre',
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Total',
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Vacant',
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tableElements() {
    List<BedsModel> bedsList = dummyData();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                color: assignColour(bedsList[index]),
                child: ExpandablePanel(
                  header: Row(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          bedsList[index].name,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: Text(
                          bedsList[index].lastUpdatedStatus,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${bedsList[index].total}',
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${bedsList[index].vacant}',
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(hasIcon: false),
                  collapsed: null,
                  expanded: detailsCard(bedsList[index]),
                ),
              ),
              // SizedBox(height: 5),
              Divider(height: 1, color: Colors.black),
            ],
          );
        },
        childCount: bedsList.length,
      ),
    );
  }
}

Widget detailsCard(BedsModel details) {
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
              details.name,
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
                      'Contact numbers: ',
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View Location: ',
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text('name',textScaleFactor: 1.2,),
                    Text(
                      '9126485236, 91264856',
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

Color assignColour(BedsModel bedDetails) {
  int count = bedDetails.vacant;
  if (count >= 20) {
    return Colors.greenAccent[400];
  } else if (count > 0 && count <= 10) {
    return Colors.amberAccent[100];
  }
  return Colors.deepOrange[400];
}

List<BedsModel> dummyData() {
  return [
    BedsModel(
      'Janata Covid Center',
      '10:20 AM, Jun 05',
      100,
      20,
    ),
    BedsModel(
      'Columbia Asia Hospital',
      '11:04 PM, Jun 06',
      60,
      10,
    ),
    BedsModel(
      'Apollo Hospital',
      '09:05 AM, Jun 04',
      100,
      5,
    ),
    BedsModel(
      'Krishnagar Covid Center',
      '01:00 pM, Jun 06',
      100,
      0,
    ),
    BedsModel(
      'Kamakshi Hospital',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
    BedsModel(
      'KN Covid Center',
      '01:00 PM, Jun 06',
      100,
      9,
    ),
    BedsModel(
      'Mys Hospital',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
    BedsModel(
      'Apl Hospital',
      '09:05 AM, Jun 04',
      50,
      13,
    ),
    BedsModel(
      'kshi Hospital',
      '10:20 AM, Jun 05',
      100,
      40,
    ),
    BedsModel(
      'NR Hospital',
      '10:20 AM, Jun 05',
      30,
      25,
    ),
    BedsModel(
      'New Covid Center',
      '09:05 AM, Jun 04',
      60,
      40,
    ),
    BedsModel(
      'NH Hospital',
      '10:20 AM, Jun 05',
      150,
      30,
    ),
  ];
}
