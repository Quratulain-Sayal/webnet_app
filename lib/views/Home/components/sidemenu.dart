import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/views/Home/components/blogs/blogs_list.dart';
import 'package:webnet_app/views/Home/components/customers/customer_list.dart';
import 'package:webnet_app/views/Home/components/pages/pages_list.dart';
import 'package:webnet_app/views/Home/components/products/add_products.dart';
import 'package:webnet_app/views/Home/components/products/products_list.dart';
import 'package:webnet_app/views/Home/components/sliders/add_sliders.dart';
import 'package:webnet_app/views/Home/components/users/userslist.dart';
import 'package:webnet_app/views/Home/home_screen.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF4F6F8),
      child: Column(children: [
        Container(
          child: DrawerHeader(
            child: Image.asset("assets/images/logo-light.png"),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  'NAVIGATION',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              DrawerListTileHeader(
                  title: "Dashboard",
                  svgSrc: "assets/images/dashboard.png",
                  press: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homepage()));
                  }),
              DrawerListTile(
                title: "Sliders",
                svgSrc: "assets/images/setting.png",
                press: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSliders()));
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      'E-C0MMERCE',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              ExpansionDrawerListTile(
                title: "Store",
                svgSrc: "assets/images/drop.png",
                children:[DrawerSubListTile(title: '', press: () {})],
              
              ),
              DrawerListTile(
                title: "Orders",
                svgSrc: "assets/images/orders.png",
                press: () {
                 
                },
              ),
              DrawerListTile(
                title: "Brand",
                svgSrc: "assets/images/brand.png",
                press: () {
                 
                },
              ),
              ExpansionDrawerListTile(
                title: "Products",
                svgSrc: "assets/images/product.png",
                children: [
                  DrawerSubListTile(
                      title: 'Products List',
                      press: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsList()));
                      }),
                  DrawerSubListTile(
                      title: 'Add Products',
                      press: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProducts()));
                      }),
                       DrawerSubListTile(title: 'Categories', press: () {}),
                        DrawerSubListTile(title: 'Receiving Notes', press: () {}),
                         DrawerSubListTile(title: 'Issuance Notes', press: () {}),
                          DrawerSubListTile(title: 'Shipping', press: () {}),
                           DrawerSubListTile(title: 'Discounts', press: () {}),
                            DrawerSubListTile(title: 'Reports', press: () {}),
                             DrawerSubListTile(title: 'Atttributes', press: () {}),
                ],
              ),
              ExpansionDrawerListTile(
                title: "Customers",
                svgSrc: "assets/images/customers.png",
                children: [
                  DrawerSubListTile(title: 'Customers List', press: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerList()));
                  }),
                  DrawerSubListTile(title: 'Add Customers', press: () {}),
                ],
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  'CMS',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ExpansionDrawerListTile(
                title: "Blogs",
                svgSrc: "assets/images/blogger.png",
                children: [
                  DrawerSubListTile(
                      title: 'Blog List',
                      press: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlogList()));
                      }),
                  DrawerSubListTile(title: 'Add Blog', press: () {}),
                  DrawerSubListTile(title: 'Category List', press: () {}),
                  DrawerSubListTile(title: 'Comments', press: () {}),
            
                ],
              ),
              ExpansionDrawerListTile(
                title: "Pages",
                svgSrc: "assets/images/webpage.png",
                children: [
                  DrawerSubListTile(
                      title: 'Pages List',
                      press: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PagesList()));
                      }),
                  DrawerSubListTile(title: 'Add Page', press: () {}),
                ],
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  'SEO',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ExpansionDrawerListTile(
                title: "Schema",
                svgSrc: "assets/images/data-structure.png",
                children: [
                  DrawerSubListTile(title: 'Schema List', press: () {}),
                  DrawerSubListTile(title: 'Add Schema', press: () {}),
                ],
              ),
              ExpansionDrawerListTile(
                title: "URL Redirection",
                svgSrc: "assets/images/link.png",
                children: [
                  DrawerSubListTile(title: 'Redirection List', press: () {}),
                  DrawerSubListTile(title: 'Add URL', press: () {}),
                ],
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  'ADDITIONALS',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ExpansionDrawerListTile(
                title: "Inbox",
                svgSrc: "assets/images/inbox.png",
                children: [
                  DrawerSubListTile(title: 'Contact', press: () {}),
                  DrawerSubListTile(title: 'Subscriptions', press: () {}),
                ],
              ),
              DrawerListTile(
                title: 'Settings',
                press: () {},
                svgSrc: 'assets/images/settings.png',
              ),
              DrawerListTile(
                title: 'Reviews',
                press: () {},
                svgSrc: 'assets/images/review.png',
              ),
              DrawerListTile(
                  title: 'Site Notifications',
                   press: () {},
                    svgSrc: 'assets/images/internet.png'),
              DrawerListTile(title: 'SMS',
               press: () {},
                svgSrc: 'assets/images/sms.png'),
              DrawerListTile(title: "FAQ'S", 
              press: () {}, 
              svgSrc: 'assets/images/chat.png'),
              DrawerListTile(title: 'Menu', 
              press: () {},
               svgSrc: 'assets/images/menu.png'),
              ExpansionDrawerListTile(
                title: "User Management",
                svgSrc: "assets/images/management.png",
                children: [
                  DrawerSubListTile(
                      title: 'Users',
                      press: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Userslist()));
                      }),
                  DrawerSubListTile(title: 'Groups', press: () {}),
                ],
              ),
              DrawerListTile(
                title: "Links",
                svgSrc: "assets/images/link.png",
                press: () {},
              ),
              DrawerListTile(
                title: "Testimonials",
                svgSrc: "assets/images/testimonial.png",
                press: () {},
              ),
                Divider( ),
            SizedBox(height: 50),
          Padding(
               padding: EdgeInsets.symmetric(horizontal: 20, ),
               child: Row(
                 children: [
                   Text('For help?' ,style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 20, color: Color(0xFF782572), fontWeight: FontWeight.bold)
                   ),),
                 ],
               ),
             ),
              ListTile(title: Text('Email info', style: GoogleFonts.lato(
                textStyle: TextStyle( color: Color(0xff7fc1fc),
                 fontWeight: FontWeight.bold, fontSize: 16)
               ), ), subtitle:  Text('info@webnet.com.pk', style:  GoogleFonts.lato(
                 color: Colors.black))),
             
              ListTile(title: Text('Call', style: GoogleFonts.lato(
                textStyle: TextStyle( color: Color(0xff7fc1fc), fontWeight: FontWeight.bold , fontSize: 16)
               ),),  subtitle: Text('(+92) 307 333 7310', style: 
               GoogleFonts.lato(color: Colors.black),)),
            SizedBox(height: 40),
            ],
            
          ),
          
        ),
        
      
      ]),
    );
  }
}

class DrawerListTileHeader extends StatelessWidget {
  const DrawerListTileHeader({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        onTap: press,
      
        leading: Image.asset(
          svgSrc,
          color: Color(0xFF782572),
          height: 20,
          width: 20
        ),
        title: Text(
          title,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Color(0xFF782572),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        onTap: press,
      
        leading: Image.asset(
          svgSrc,
          height: 20,
          width: 20,
        ),
        title: Text(
          title,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

// ExpansionTile for the expandable items in the drawer
class ExpansionDrawerListTile extends StatelessWidget {
  const ExpansionDrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.children,
  }) : super(key: key);

  final String title, svgSrc;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
        leading: Image.asset(
          svgSrc,
          height: 20,
          width: 20,
        ),
        title: Text(
          title,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
        children: children,
      ),
    );
  }
}

// Sub-ListTile for the children of the expandable tiles
class DrawerSubListTile extends StatelessWidget {
  const DrawerSubListTile({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ListTile(
        onTap: press,
        title: Text(
          title,
          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, fontSize: 14))
        ),
      ),
    );
  }
}
