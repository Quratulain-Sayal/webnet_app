import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Login/onboardingscreen.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GetStart()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
     // backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1, // 10% horizontal padding
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage("assets/images/logo-light.png"),
                        width: screenWidth * 0.6, // Responsive width for the image
                        height: screenHeight * 0.2, // Responsive height for the image
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: screenWidth * 0.05, // Responsive size for the indicator
                    width: screenWidth * 0.05,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // Space between indicator and text
                  Text(
                    'Loading',
                   
                  ),
                  SizedBox(height: screenHeight * 0.05), // Space between loading text and bottom text
                ],
              ),
              Text(
                '2024 © Webnet Pakistan.',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size for copyright text
                    color: Color(0xFF797979),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
