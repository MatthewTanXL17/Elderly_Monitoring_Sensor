import 'package:flutter/material.dart';
import 'package:appcode/pages/components/home_buttons.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: size.height * 0.1),
          const Center(
            child: Text(
              "Welcome to the Elderly Monitoring App!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: Text(
              "Please select the status that you would wish to monitor.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButtons(
                onTap: () {
                  Navigator.pushNamed(context, '/pulseHistory');
                },
                heightfromtop: 0,
                size: size,
                title: 'Pulse\nRate',
                icon: 'assets/pulse-rate.png',
                fontsize: 20,
                imagescale: 5,
              ),
              MenuButtons(
                onTap: () {
                  Navigator.pushNamed(context, '/oxygenHistory');
                },
                heightfromtop: 10,
                size: size,
                title: 'SpO2',
                icon: 'assets/oxygen-saturation.png',
                fontsize: 20,
                imagescale: 5,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.04,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuButtons(
                onTap: () {
                  Navigator.pushNamed(context, '/tempHistory');
                },
                heightfromtop: 10,
                size: size,
                title: 'Body Temperature',
                icon: 'assets/thermometer.png',
                fontsize: 18,
                imagescale: 5,
              ),
              MenuButtons(
                onTap: () {
                  Navigator.pushNamed(context, '/pulse');
                },
                heightfromtop: 10,
                size: size,
                title: 'Fall\nhistory',
                icon: 'assets/falling.png',
                fontsize: 20,
                imagescale: 9,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.08,
          ),
        ],
      ),
    );
  }
}
