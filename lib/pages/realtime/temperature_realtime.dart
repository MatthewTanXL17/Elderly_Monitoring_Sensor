import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref();

class TemperatureRealTime extends StatefulWidget {
  const TemperatureRealTime({Key? key}) : super(key: key);

  @override
  _TemperatureRealTimeState createState() => _TemperatureRealTimeState();
}

class _TemperatureRealTimeState extends State<TemperatureRealTime> {

  Query tempSync = FirebaseDatabase.instance.ref()
      .child('readings')
      .limitToLast(1);

  Widget _buildTemperatureRealTime({required Map temperatureRealtime}) {
    return Container(
      width: 300,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey[600],
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Image.asset('assets/thermometer.png', fit: BoxFit.fill,),
              title: Text('Body Temperature',style: TextStyle(fontSize: 25) ),
              subtitle: Text(temperatureRealtime['celcius'] + "°C", style: TextStyle(fontSize: 30)),
              // trailing: Text(temperatureRealtime['timestamp']),
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/tempHistory');
                }, child: Text("Show History"))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time Body Temperature"),
      ),
      body: FirebaseAnimatedList(
        query: tempSync,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map temperatureRealtime = snapshot.value as Map;
          return _buildTemperatureRealTime(temperatureRealtime: temperatureRealtime);
        },
      ),

    );
  }
}
