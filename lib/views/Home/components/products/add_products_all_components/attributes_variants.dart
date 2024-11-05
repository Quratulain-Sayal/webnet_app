import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';

class AttributesVariants extends StatefulWidget {
  const AttributesVariants({super.key});

  @override
  State<AttributesVariants> createState() => _AttributesVariantsState();
}

class _AttributesVariantsState extends State<AttributesVariants> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
    return Padding(padding: EdgeInsets.all(8.0), child: Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ExpansionTile(title:  Text('ATTRIBUTES / VARIANTS',
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
          children: [
            Padding(padding: EdgeInsets.all(defaultpadding),
            child: Column(
              children: [

              ],
            ),)
          ],),
    ),);
  }
}