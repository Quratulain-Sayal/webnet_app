import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';

class Additionals extends StatefulWidget {
  const Additionals({super.key});

  @override
  State<Additionals> createState() => _AdditionalsState();
}

class _AdditionalsState extends State<Additionals> {
   bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(padding: EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      child: ExpansionTile(title: Text('ADDITIONALS',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: Colors.grey,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children:[
            Padding(padding: EdgeInsets.all(defaultpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Text("What's New ", style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label:Text("What's New"),
                      border: OutlineInputBorder(),
                    ),
                  ),
              ],
            ),),
            
          ],),
    ),);
  }
}