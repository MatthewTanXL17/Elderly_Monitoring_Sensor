import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class OxygenHistory extends StatefulWidget {
  const OxygenHistory({Key? key}) : super(key: key);

  @override
  _OxygenState createState() => _OxygenState();
}

class _OxygenState extends State<OxygenHistory> {
  Query oxyHist = FirebaseDatabase.instance
      .ref()
      .child('readings/store');

  Widget _buildOxygenHistory({required Map oxygen}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 6),
              Icon(
                Icons.access_time_outlined,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 6),
              Text(
                oxygen['timestamp'],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 75,
              ),
              Image.asset(
                'assets/oxygen-saturation.png',
                height: 50,
              ),
              SizedBox(
                width: 4,
              ),
              Text(oxygen['SpO2'],
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('SpO2 History!'),
        ),
        body: Container(
          height: double.infinity,
          child: Scrollbar(
            showTrackOnHover: true,
            thickness: 10,
            radius: Radius.circular(10),
            child: FirebaseAnimatedList(
              query: oxyHist,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map oxygen = snapshot.value as Map;
                return _buildOxygenHistory(oxygen: oxygen);
              },
            ),
          ),
        ));
  }
}
