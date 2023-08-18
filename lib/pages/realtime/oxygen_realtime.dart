import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class OxygenRealTime extends StatefulWidget {
  const OxygenRealTime({Key? key}) : super(key: key);

  @override
  _OxygenRealTimeState createState() => _OxygenRealTimeState();
}

class _OxygenRealTimeState extends State<OxygenRealTime> {

  Query oxySync = FirebaseDatabase.instance.ref()
      .child('readings')
      .limitToLast(1);

  Widget _buildOxygenRealTime({required Map oxygenRealtime}) {
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
              leading: Image.asset('assets/oxygen-saturation.png', fit: BoxFit.fill,),
              title: const Text('Blood Oxygen Saturation'),
              subtitle: Text(oxygenRealtime['SpO2'], style: const TextStyle(fontSize: 20),),
              //trailing: Text(oxygenRealtime['timestamp']),
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/oxygenHistory');
                }, child: const Text("Show History"))
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
        title: const Text("Realtime Blood O2 Saturation"),
      ),
      body: Container(
        child: FirebaseAnimatedList(
          query: oxySync,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map oxygenRealtime = snapshot.value as Map;
            return _buildOxygenRealTime(oxygenRealtime: oxygenRealtime);
          },
        ),
      ),

    );
  }
}
