import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/social_links.dart';
import 'package:my_portfolio/widgets/custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //Title
          const Text(
            "Get In Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          //Text Fields
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > kMinDesktopWidth) {
                return buildNameEmailFieldDesktop();
              }
              return buildNameEmailFieldMobile();
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          //message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: const CustomTextField(
              hintText: "Your message",
              maxLines: 15,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                  foregroundColor: CustomColor.whitePrimary,
                ),
                onPressed: () {},
                child: const Text("Get in touch"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(
            height: 15,
          ),
          //SNS icons button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SocialLinks.github]);
                },
                child: Image.asset(
                  "assets/social/Github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SocialLinks.instagram]);
                },
                child: Image.asset(
                  "assets/social/Instagram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SocialLinks.youtube]);
                },
                child: Image.asset(
                  "assets/social/Youtube.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SocialLinks.linkedin]);
                },
                child: Image.asset(
                  "assets/social/Linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SocialLinks.whatsapp]);
                },
                child: Image.asset(
                  "assets/social/Whatsapp.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column buildNameEmailFieldMobile() {
    return const Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //email
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Row buildNameEmailFieldDesktop() {
    return const Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        SizedBox(
          width: 15,
        ),
        //email
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
}
