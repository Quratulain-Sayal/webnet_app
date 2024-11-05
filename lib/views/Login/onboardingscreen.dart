import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Login/loginscreen.dart';



class GetStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
         // color: bgColor
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width - 70.0,
                      height: size.width - 90.0,
                      margin: const EdgeInsets.only(top: 50.0, bottom: 35.0),
                      decoration:const  BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/content.png"), 
                        fit: BoxFit.fitWidth),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "Let's get Started",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50.0),
                      child:   Text(
                        "Never a better time than now to start thinking about how you manage all your content with ease.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                            height: 1.6,
                            color: Colors.black,
                            //: FontWeight.bold, // Text weight
                          ),
                      ),
                    )
                 ) ],
                ),
              ),
              /*** footer ***/
              Container(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        margin: EdgeInsets.only(bottom: 30.0),
                        width: size.width - 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(180.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3),
                            )
                          ]
                        ),
                        child: Center(
                          child: Text(
                          'Get Started',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold, // Text weight
                            ),
                          ),
                                                ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      },
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}