import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FallHistory extends StatefulWidget {
  const FallHistory({Key? key}) : super(key: key);

  @override
  _FallHistoryState createState() => _FallHistoryState();
}

class _FallHistoryState extends State<FallHistory> {
  Query fallHist = FirebaseDatabase.instance
      .ref()
      .child('readings/storefall');

  Widget _buildFallHistory({required Map fallhistory}) {
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
                fallhistory['timestamp'],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 90,
              ),
              Image.asset(
                'assets/falling.png',
                height: 40,
              ),
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
          title: Text('Fall Detection History'),
        ),
        body: Container(
          height: double.infinity,
          child: Scrollbar(
            showTrackOnHover: true,
            thickness: 10,
            radius: Radius.circular(10),
            child: FirebaseAnimatedList(
              query: fallHist,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map fallhistory = snapshot.value as Map;
                return _buildFallHistory(fallhistory: fallhistory);
              },
            ),
          ),
        )
    );
  }
}
