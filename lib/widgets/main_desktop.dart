import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.25,
      constraints: const BoxConstraints(
        minHeight: 300.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Hi, \nI'm Siavash. \nWelcome to my portfolio \nhosted on AWS S3 (WIP).",
                  style: TextStyle(
                    fontSize: 30.0,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  )),
              SizedBox(height: 15),              
            ],
          ),
          Image.asset(
            "assets/profile.png",
            width: screenWidth / 2.5,
          )
        ],
      ),
    );
  }
}
