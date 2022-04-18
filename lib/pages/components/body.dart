import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          const Center(
            child: Text(
              "Please select status to monitor",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/pulse');
                    },
                    child: Container(
                        height: size.height * 0.105,
                        width: size.width * 0.21,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 30,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/pulse-rate.png'),
                          backgroundColor: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  const Text("Pulse Rate")
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/oxygen');
                    },
                    child: Container(
                        height: size.height * 0.105,
                        width: size.width * 0.21,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 30,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/oxygen-saturation.png'),
                          backgroundColor: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  const Text("Oxygen Saturation")
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/temp');
                    },
                    child: Container(
                        height: size.height * 0.105,
                        width: size.width * 0.21,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 30,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/thermometer.png'),
                          backgroundColor: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text("Temperature")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
