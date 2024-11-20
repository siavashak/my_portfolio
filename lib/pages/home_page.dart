import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

import '../widgets/header_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.scaffoldBG,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // MAIN
            // const HeaderDesktop(),
            Container(
                height: 50.0,
                margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                decoration: kHeaderDecoration,
                child: Row(
                  children: [
                    SiteLogo(
                      onTap: () {},
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    )
                  ],
                )),
            // SKILLS
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
            // PROJECTS
            Container(
              height: 500,
              width: double.maxFinite,
            ),
            // CONTACT US
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
            // FOOTER
            Container(
              height: 500,
              width: double.maxFinite,
            ),
          ],
        ));
  }
}
