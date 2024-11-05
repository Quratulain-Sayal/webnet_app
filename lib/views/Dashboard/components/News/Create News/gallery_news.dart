import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/views/Dashboard/components/News/Create%20News/add_news.dart';
import 'package:webnet_app/views/Dashboard/components/News/Create%20News/attributes_news.dart';
import 'package:webnet_app/views/Dashboard/components/News/News%20List/news_list.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Text('Add News', style: Theme.of(context).textTheme.titleLarge),
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
                    MaterialPageRoute(builder: (context) => AttributesNews()));
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
    );
  }
}
