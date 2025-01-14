import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        height: 500,
        constraints: const BoxConstraints(
          minHeight: 680,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //avatar image
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(colors: [
                    CustomColor.scaffoldBG.withOpacity(0.6),
                    CustomColor.scaffoldBG.withOpacity(0.6),
                  ]).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Image.asset(
                  "assets/profile.png",
                  width: screenWidth,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Hi, \nI'm Siavash Akrami \nand this is my portfolio.",
                  style: TextStyle(
                    fontSize: 24,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  )),
              const SizedBox(height: 10),
              SizedBox(
                width: 210,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary,
                    foregroundColor: CustomColor.whitePrimary,
                  ),
                  onPressed: () {},
                  child: const Text("Get in Touch"),
                ),
              )
            ]));
  }
}
