import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Home/components/components.dart';

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
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff782572),
          actions: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SvgIcon(
                    icon: SvgIconData('assets/images/notification.svg'),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ProfileDropdown())
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultpadding),
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
