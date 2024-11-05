import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';

//import 'package:webnet_app/views/Dashboard/components/header.dart';

//import 'package:webnet_cms/views/Home/components/products/related_products.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // e.g., 800 pixels
 
    return SafeArea(
      child: Scaffold(
        drawer: Sidemenu(),
        appBar: AppBar(
          backgroundColor: const Color(0xFF770099),
          actions: const [
            Row(
              children: [
              //  Notifications(),
                SizedBox(width: 10),
                //ProfileCard(),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultpadding2, vertical: defaultpadding2),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Ensure proper alignment
              children: [
                SizedBox(height: defaultpadding),
                Text(
                  "Add Products",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize:heading,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF505458),
                    ),
                  ),
                ),
                

                // Wrap components in SizedBox/ConstrainedBox to give proper height
               
                //RelatedProducts(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
