import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/views/Login/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webnet Pakistan pvt Ltd Cms',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFF4F6F8),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: Color(0xFFF4F6F8),
      ),
      home: Splash());
      
    
  }
}
