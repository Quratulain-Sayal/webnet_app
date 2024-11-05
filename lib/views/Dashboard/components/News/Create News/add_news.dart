import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Dashboard/components/News/Components/featured_image.dart';
import 'package:webnet_app/views/Dashboard/components/News/Create%20News/attributes_news.dart';
import 'package:webnet_app/views/Dashboard/components/News/Create%20News/gallery_news.dart';
import 'package:webnet_app/views/Dashboard/components/News/News%20List/news_list.dart';


class AddNews extends StatefulWidget {
  const AddNews({super.key});

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _shortDescriptionController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // If title is valid and all fields are filled, show success message
      if (_shortDescriptionController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('News added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      // Show error for the title if empty
      if (_titleController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Title is required'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add News', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
       // backgroundColor: bgColor,
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
              if (value == 'attributes') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AttributesNews()));
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
                  value: 'attributes',
                  child: Text(
                    'Attributes',
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
      body: Responsive(
        mobile: _buildForm(context),
        tablet: _buildForm(context),
        desktop: _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultpadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BASIC DETAILS',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Title',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'News Title',
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Short Description',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _shortDescriptionController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Featured Image',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              FeaturedImagePicker(),
              const SizedBox(height: 40),

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
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _shortDescriptionController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
