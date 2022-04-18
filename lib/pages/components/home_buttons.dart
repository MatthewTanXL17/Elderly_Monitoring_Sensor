import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuButtons extends StatelessWidget {
  const MenuButtons({
    Key? key,
    required this.heightfromtop,
    required this.size,
    required this.icon,
    required this.title,
    required this.fontsize,
    required this.imagescale,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String icon;
  final String title;
  final double fontsize;
  final double imagescale;
  final VoidCallback? onTap;
  final double heightfromtop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: size.height * 0.22,
            width: size.width * 0.35,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(height: heightfromtop),
                Image.asset(icon,scale: imagescale,),
                SizedBox(height: 4),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: fontsize,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}