import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class FeaturedImagePicker extends StatefulWidget {
  @override
  _FeaturedImagePickerState createState() => _FeaturedImagePickerState();
}

class _FeaturedImagePickerState extends State<FeaturedImagePicker> {
  File? _image; // File to hold the image
  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Store the image file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container to display the selected image or a placeholder
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: _image == null
              ? Center(
                  child: Text(
                  'No Image Selected',
                  style: Theme.of(context).textTheme.bodySmall,
                ))
              : Image.file(_image!, fit: BoxFit.cover),
        ),
        SizedBox(height: 10),
        // Button to pick an image
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(
            Icons.image,
            color: Colors.white,
          ),
          label:  Text('Select Featured Image',
              style: GoogleFonts.lato( textStyle: TextStyle( fontSize:14.0, color: Colors.white))),
               style: ElevatedButton.styleFrom(
    
     
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
      ), // Border style
    ),
        ),
      ],
    );
  }
}
