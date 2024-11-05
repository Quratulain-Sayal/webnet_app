import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/views/Dashboard/components/Recentorders.dart';
import 'package:webnet_app/views/Dashboard/components/weeklysales.dart';
import 'package:webnet_app/views/Home/components/components.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

var admin = " Qurban";
final List<Map<String, dynamic>> statisticsList = [
  {
    "title": "Total Orders",
    "value": "1877",
    "color": Color(0xfff5707a),
    "image": "assets/images/checkout.png"
  },
  {
    "title": "Total Customers",
    "value": "1367",
    "color": Color(0xff188ae2),
    "image": "assets/images/customer.png"
  },
  {
    "title": "Pending Orders",
    "value": "699",
    "color": Color(0xfff9c851),
    "image": "assets/images/requisition.png"
  },
  {
    "title": "Today's Orders",
    "value": "0",
    "color": Color(0xff3ac9d6),
    "image": "assets/images/recent.png"
  },
  {
    "title": "Total Products",
    "value": "22",
    "color": Color(0xff3ac9d6),
    "image": "assets/images/order.png"
  },
  {
    "title": "Total Brands",
    "value": "0",
    "color": Color(0xff3ac9d6),
    "image": "assets/images/reputation.png"
  },
];

class _HomepageState extends State<Homepage> {
  // Mark the field as late or provide an initializer
  late List<bool> _iconVisible; // Marked as late
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize all icons to be invisible
    _iconVisible = List<bool>.filled(statisticsList.length, false);
  }

  void _toggleIconVisibility(int index) {
    setState(() {
      // Set the icon to visible if it's not already visible
      if (!_iconVisible[index]) {
        _iconVisible[index] = true; // Make the icon visible
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  bool isDarkTheme = false; // Track the current theme state

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfff4f6f8),
      drawer: const Drawer(
        child: Sidemenu(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff782572),
        actions: const[
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfff4f6f8),
                  hintText: "Search  ", hintStyle: GoogleFonts.lato(color: Colors.black),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.black),
                          onPressed: _clearSearch,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                ),
                onChanged: (value) {
                  setState(() {}); // Updates the suffix icon when text is input
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Good Morning$admin,',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Let's begin to create amazaing content !",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Color(0xFF752376),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(statisticsList.length, (index) {
                final item = statisticsList[index];
                return GestureDetector(
                  onTap: () => _toggleIconVisibility(index), // Handle tap
                  child: Container(
                    height: 120,
                    width: 300, // Adjust the width according to your design
                    margin:
                        const EdgeInsets.only(right: 10), // Space between items
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Image.asset(
                              item['image'],
                              width: 40,
                              height: 40,
                            ),
                            title: Text(
                              item['title'],
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Color(0xff337ab7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              item['value'],
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: item['color'],
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            trailing: AnimatedOpacity(
                              opacity: _iconVisible[index]
                                  ? 1.0
                                  : 0.0, // Toggle opacity
                              duration: const Duration(
                                  milliseconds: 200), // Animation duration
                              child: InkWell(
                                child: Image.asset(
                                  'assets/images/next-button.png', // Your trailing icon
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
         const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weekly Sales",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF752376),
                  ),
                ),
                Icon(
                  Icons.open_in_new,
                  color: Color(0xFF337AB7),
                ),
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15
            ),
            child: WeeklySales(),
          ),
         const  SizedBox(height: 10,),
         const  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Orders  ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF752376)),
                  ),
                  Icon(
                    Icons.open_in_new,
                    color: Color(0xFF337AB7),
                  ),
                ],
              ),
          ),
        
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: RecentOrders(),
          ),
          const SizedBox(height: 20),
        
        ]),
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
    ));
  }
}
