import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref();

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  _HeartRateState createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  // showData() async {
  //   final snapshot = await ref.child('readings/store').get();
  //   if (snapshot.exists) {
  //     print(snapshot.value);
  //     print("/n");
  //     print(snapshot.key);
  //     print("/n");
  //     print(snapshot.children);
  //   } else {
  //     print('No data available');
  //   }
  // }

  Query dref = FirebaseDatabase.instance
      .ref()
      .child('readings/store')
      .orderByChild('timestamp');

  Widget _buildPulseHistory({required Map pulse}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 80,
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
              Icon(
                Icons.access_time_outlined,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 6),
              Text(
                pulse['timestamp'],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 80,
              ),
              Image.asset(
                'assets/pulse-rate.png',
                height: 40,
              ),
              SizedBox(
                width: 6,
              ),
              Text(pulse['BPM'],
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
          title: Text('Heart Rate!'),
        ),
        body: Container(
          height: double.infinity,
          child: Scrollbar(
            showTrackOnHover: true,
            thickness: 10,
            radius: Radius.circular(10),
            child: FirebaseAnimatedList(
              query: dref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map pulse = snapshot.value as Map;
                return _buildPulseHistory(pulse: pulse);
              },
            ),
          ),
        ));
  }
}
