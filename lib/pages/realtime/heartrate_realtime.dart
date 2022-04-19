import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref();

class HeartRateRealtime extends StatefulWidget {
  const HeartRateRealtime({Key? key}) : super(key: key);

  @override
  _HeartRateRealtimeState createState() => _HeartRateRealtimeState();
}

class _HeartRateRealtimeState extends State<HeartRateRealtime> {

  Query pulseSync = FirebaseDatabase.instance.ref()
      .child('readings')
      .limitToLast(1);

  Widget _buildPulseRealTime({required Map pulseRealtime}) {
    return Container(
      width: 300,
      height: 190,
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
              leading: Image.asset('assets/pulse-rate.png', fit: BoxFit.fill,),
              title: Text('Pulse Rate'),
              subtitle: Text(pulseRealtime['BPM'],style: TextStyle(fontSize: 20)),
              trailing: Text(pulseRealtime['timestamp']),
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/pulseHistory');
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
        title: Text("Real Time Pulse Rate"),
      ),
      body: Container(
        child: FirebaseAnimatedList(
          query: pulseSync,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map pulseRealtime = snapshot.value as Map;
            return _buildPulseRealTime(pulseRealtime: pulseRealtime);
          },
        ),
      ),

    );
  }
}
