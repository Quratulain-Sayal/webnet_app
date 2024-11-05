import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';

class Seocontent extends StatefulWidget {
  const Seocontent({super.key});

  @override
  State<Seocontent> createState() => _SeocontentState();
}

class _SeocontentState extends State<Seocontent> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ExpansionTile(
          title: Text('SEO',
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
            Padding(
              padding: EdgeInsets.all(defaultpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Meta Title', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label:Text('Meta title'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                    Text('Meta Description', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    maxLines: 4,
                    
                    decoration: InputDecoration(
                     // labelText: 'Meta Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                    Row(
                      children: [
                        Text('Meta Keywords', style: GoogleFonts.lato(
                        textStyle:const  TextStyle(fontSize: 14, 
                        color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                        SizedBox(width: 5,),
                        Text('(comma seperated)',style: GoogleFonts.lato(
                        textStyle: const TextStyle(fontSize: 12, 
                        color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                      ],
                    ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label:Text('add tag'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                   Text('Link Canonical', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label:Text('Link Canonical'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
          ]),
      ),
    ])));
  }
}
