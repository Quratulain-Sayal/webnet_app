import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Dashboard/components/News/Create%20News/add_news.dart';
import 'package:webnet_app/views/Dashboard/components/News/Create%20News/gallery_news.dart';
import 'package:webnet_app/views/Dashboard/components/News/News%20List/news_list.dart';


class AttributesNews extends StatefulWidget {
  const AttributesNews({super.key});

  @override
  State<AttributesNews> createState() => _AttributesNewsState();
}

class _AttributesNewsState extends State<AttributesNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Add News', style: Theme.of(context).textTheme.titleLarge),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              iconColor: Colors.black,
              onSelected: (String value) {
              if (value == 'basic details') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNews()));
              } else if (value == 'gallery') {
                 Navigator.push(context,
                 MaterialPageRoute(builder: (context) => Gallery()));
              } else if (value == 'news_list') {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsList()));
              }
            },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'basic details',
                    child: Text(
                      'Basic Details',
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'gallery',
                    child: Text(
                      'Gallery',
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'news_list',
                    child: Text(
                      ' Back to News List',
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ),
                  // You can add more items here if needed
                ];
              },
              color: Colors.white,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(defaultpadding),
          child: Column(children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ATTRIBUTES',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Masters',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Masters',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Bachelors',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bachelors',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Linked-in',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Linked-in',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Teaching Exp',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Teaching Exp',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Certifications',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Certifications',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Industrial Association',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Industrial Association',
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Save button
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text(
                          'Save',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation:
                              5, // Adding elevation for a professional look
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            // side:const  BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        )));
  }
}
