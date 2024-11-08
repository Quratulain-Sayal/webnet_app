import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // Add image picker package
import 'package:webnet_app/const/constants.dart';
import 'dart:io';

//import 'package:webnet_cms/const/constants.dart';

class SliderImageScreen extends StatefulWidget {
  @override
  _SliderImageScreenState createState() => _SliderImageScreenState();
}

class _SliderImageScreenState extends State<SliderImageScreen> {
  List<SliderItem> sliders = []; // List to keep track of added sliders
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        sliders[index].image = File(image.path);
      });
    }
  }

  // Function to add a new slider (with expanded state by default)
  void _addSlider() {
    setState(() {
      sliders.add(SliderItem(isExpanded: true)); // Start expanded by default
    });
  }

  // Function to remove a slider
  void _removeSlider(int index) {
    setState(() {
      sliders.removeAt(index);
    });
  }

  // Function to toggle expansion of a slider
  void _toggleExpand(int index) {
    setState(() {
      sliders[index].isExpanded = !sliders[index].isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
   // double screenWidth = MediaQuery.of(context).size.width;
   // double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView( // Ensure scrollability if content exceeds screen height
        child: Padding(
          padding: const EdgeInsets.all(defaultpadding),
          child: Column( // Column will expand as content increases
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Slider*',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF797979),
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _addSlider,
                    child: Icon(Icons.add),
                    mini: true,
                    backgroundColor: Color(0xFF188AE2),
                  ),
                ],
              ),
              SizedBox(height: 10), // Add some space between title and slider list
              sliders.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true, // Prevent ListView from taking infinite space
                      physics: NeverScrollableScrollPhysics(), // Disable inner scrolling to avoid conflicts
                      itemCount: sliders.length,
                      itemBuilder: (context, index) {
                        return SliderWidget(
                          slider: sliders[index],
                          onImagePick: () => _pickImage(index),
                          onRemove: () => _removeSlider(index),
                          onExpand: () => _toggleExpand(index),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No sliders added yet!",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// Model for Slider Item
class SliderItem {
  File? image;
  String link = '';
  bool isExpanded;

  SliderItem({this.image, this.link = '', this.isExpanded = false});
}

// Convert SliderWidget to StatefulWidget
class SliderWidget extends StatefulWidget {
  final SliderItem slider;
  final VoidCallback onImagePick;
  final VoidCallback onRemove;
  final VoidCallback onExpand;

  const SliderWidget({
    Key? key,
    required this.slider,
    required this.onImagePick,
    required this.onRemove,
    required this.onExpand,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth *1,
     // height: screenHeight*0.50,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              'SLIDER IMAGE',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              // +/- button to expand or collapse
                              IconButton(
                                onPressed: widget.onExpand,
                                icon: Icon(
                                  widget.slider.isExpanded
                                      ? Icons.remove
                                      : Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              // X button to remove slider
                              IconButton(
                                onPressed: widget.onRemove,
                                icon: Icon(Icons.close, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Expanded content (shown if slider.isExpanded is true)
              if (widget.slider.isExpanded) ...[
                GestureDetector(
                  onTap: widget.onImagePick,
                  child: Container(
                    height: screenHeight * 0.20,
                    width: screenWidth * 0.75,
                    color: Colors.grey[300],
                    child: widget.slider.image != null
                        ? Image.file(widget.slider.image!, fit: BoxFit.cover)
                        : Icon(Icons.camera_alt, size: 50),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: screenWidth * 0.75,
                    height: screenHeight * 0.10,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          'Link*',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              //color: Color(0xFF797979),
                            ),
                           // fontWeight: FontWeight.w600,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade200),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFe3e3e3),
                            width: 1.0,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          widget.slider.link = text;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
