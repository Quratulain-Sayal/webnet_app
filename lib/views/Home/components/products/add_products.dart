import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';
//import 'package:webnet_app/views/Dashboard/components/News/Create%20News/gallery_news.dart';
import 'package:webnet_app/views/Home/components/components.dart';
//import 'package:webnet_app/views/Home/components/products/add_products_all_components/attributes_variants.dart';
import 'package:webnet_app/views/Home/components/products/add_products_all_components/basic_details.dart';
import 'package:webnet_app/views/Home/components/products/products_list.dart';
//import 'package:webnet_app/views/Dashboard/components/header.dart';
//import 'package:webnet_cms/views/Home/components/products/related_products.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';
import 'package:webnet_app/views/Home/home_screen.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    double screenHeight =
        MediaQuery.of(context).size.height; // e.g., 800 pixels
    double screenWidth = MediaQuery.of(context).size.width;
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
        body: Padding(
          padding: const EdgeInsets.all(defaultpadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(defaultpadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Add Products",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF505458),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onDoubleTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                },
                                child: Image.asset(
                                  'assets/images/home.png',
                                  width: 18,
                                  height: 18,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ),
                              GestureDetector(
                                onDoubleTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductsList()));
                                },
                                child: Text(
                                  "/  Products",
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF505458),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    BasicDetails(),
                    // AttributesVariants(),
                    // Gallery()
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
