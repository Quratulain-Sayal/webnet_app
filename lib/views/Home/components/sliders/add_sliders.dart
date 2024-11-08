import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Home/components/sliders/slider_image.dart';
import 'package:webnet_app/views/Home/components/components.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';
import 'package:webnet_app/views/Home/components/sliders/sliderslist.dart';
import 'package:webnet_app/views/Home/home_screen.dart';

class AddSliders extends StatefulWidget {
  const AddSliders({super.key});

  @override
  State<AddSliders> createState() => _AddSlidersState();
}

class _AddSlidersState extends State<AddSliders> {
  List<Widget> imageContainers = [];
  // Track the current theme state
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height; // e.g., 800 pixels

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf4f6f8),
        drawer: const Drawer(
          child: Sidemenu(),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff782572),
          actions:const  [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: appBar),
                  child: SvgIcon(
                    icon: SvgIconData('assets/images/notification.svg'),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: appBar),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                      padding: const EdgeInsets.all(defaultpadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Add Sliders",
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
                                  Navigator.push(context, MaterialPageRoute(builder: 
                                  (context)=> Homepage()));
                                },
                                child: Image.asset(
                                  'assets/images/home.png',
                                  width: 18,
                                  height: 18,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: screenWidth*0.01,),
                              GestureDetector(
                                onDoubleTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder:
                                   (context)=> Sliderslist()));
                                },
                                child: Text(
                                  "/  Sliders",
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
                      Padding(
                        padding:const  EdgeInsets.all(
                          defaultpadding),
                        child: Container(
                          height: screenHeight * 0.20,
                          width: screenWidth,
                          child: Card(
                            elevation: 1,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(defaultpadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Name*',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: subheading,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 0.80,
                                    height: screenHeight * 0.10,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        label: Text(
                                          'Slider Name',
                                          style: GoogleFonts.lato(
                                            textStyle:
                                                const TextStyle(fontSize: heading
                                                    // color: Color(0xFF797979),
                                                    ),
                                            //fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade200),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFe3e3e3),
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliderImageScreen(),
                      SizedBox(height: screenHeight * 0.22),
                      Padding(
                        padding: const EdgeInsets.all(
                            defaultpadding),
                        child: Container(
                          height: screenHeight * 0.10,
                          width: screenWidth * 1,
                          child: Card(
                              elevation: 1,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(defaultpadding),
                                child: Row(
                              
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF188AE2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1))),
                                      onPressed: () {},
                                      child: Text(
                                        'Back',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: subheading,
                                            color: Colors.white,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.03,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF4bd396),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1))),
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: subheading,
                                            color: Colors.white,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Responsive.isMobile(context)
            ? BottomNavigationBar(
                backgroundColor: Color(0xfff4f6f8),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/images/dashboard.png",
                      height: 20,
                      width: 20,
                      color: Color(0xFF752376),
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/images/content-writing.png",
                      height: 20,
                      width: 20,
                      color: Color(0xFF752376),
                    ),
                    label: 'Cms',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/images/user.png",
                      height: 20,
                      width: 20,
                      color: Color(0xFF752376),
                    ),
                    label: 'Account',
                  ),
                ],
                currentIndex: 0, // Set the initial index
                selectedItemColor: const Color(0xFF505458), // Active item color
                unselectedItemColor:
                    const Color(0xFF505458), // Inactive item color
                showSelectedLabels: true, // Show labels for selected items
                showUnselectedLabels: true, // Show labels for unselected items
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'Lato', // Specify Lato font family
                  fontWeight: FontWeight.w400, // Bold for selected
                  color: Color(0xFF505458),
                  fontSize: 12,
                  // Color for selected label
                ),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Lato', // Specify Lato font family
                    color: Color(0xFF505458),
                    fontWeight: FontWeight.w400,
                    fontSize: 12 // Color for unselected label
                    ),
                onTap: (index) {
                  // Handle navigation here
                },
              )
            : null,
      ),
    );
  }
}
