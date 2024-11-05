import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';
class RelatedProducts extends StatefulWidget {
  const RelatedProducts({super.key});

  @override
  State<RelatedProducts> createState() => _RelatedProductsState();
}

class _RelatedProductsState extends State<RelatedProducts> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ExpansionTile(title:  Text(
            "RELATED PRODUCTS",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            )
          ),
          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: Colors.grey,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: const [
            Padding(padding: EdgeInsets.all(defaultpadding),
            child: Column(
              children: [

              ],
            ),)
          ],),
    ), );
  }
}