import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref();

class TemperatureHistory extends StatefulWidget {
  const TemperatureHistory({Key? key}) : super(key: key);

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<TemperatureHistory> {
  Query tempHist = FirebaseDatabase.instance
      .ref()
      .child('readings/store');

  Widget _buildTempHistory({required Map temperature}) {
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
                temperature['timestamp'],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 45,
              ),
              Image.asset(
                'assets/thermometer.png',
                height: 40,
              ),
              SizedBox(
                width: 6,
              ),
              Text(temperature['celcius'] + "°C",
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
          title: Text('Temperature!'),
        ),
        body: Container(
          height: double.infinity,
          child: Scrollbar(
            showTrackOnHover: true,
            thickness: 10,
            radius: Radius.circular(10),
            child: FirebaseAnimatedList(
              query: tempHist,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map temperature = snapshot.value as Map;
                return _buildTempHistory(temperature: temperature);
              },
            ),
          ),
        )
    );
  }
}
