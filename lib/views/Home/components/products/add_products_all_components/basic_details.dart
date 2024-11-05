import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/const/constants.dart';

class BasicDetails extends StatefulWidget {
  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  bool _isExpanded = false; // To track the expansion state

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ExpansionTile(
          title:  Text(
            "BASIC DETAILS",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            )
          ),
          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: Colors.grey,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: [
            Padding(
              padding: EdgeInsets.all(defaultpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Post Title', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label:Text('Enter title'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Text('Slug',style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)), ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Enter title'),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Text('Category', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                 CategoryWidget(),
                   
                 
                   SizedBox(height: screenHeight * 0.02),

                  Text('Brand', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                 BrandWidget(),
                   SizedBox(height: screenHeight*0.02),
                    Text('Short Description', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('Description', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                     
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('SKU', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    //maxLines: 5,
                    
                    decoration: InputDecoration(
                     labelText: 'SKU',
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('Unit', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                   // maxLines: 5,
                    decoration: InputDecoration(
                     labelText: 'eg kg,pcs etc.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('Weight', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                   // maxLines: 5,
                    decoration: InputDecoration(
                     
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('Qunatity', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    //maxLines: 5,
                    decoration: InputDecoration(
                     
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('Price', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    //maxLines: 5,
                    decoration: InputDecoration(
                     
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                   Text('Discounted Price', style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF797979), fontWeight: FontWeight.w600)),),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const TextField(
                    //maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override

  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Category1',
      'Category2',
    ];

    String? selectedValue;
    
    return DropdownButtonFormField2<String>(
      
      isExpanded: true,
      decoration: InputDecoration(
       
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        // Add more decoration..
      ),
      hint:  Text(
        'Select Category',
        style:  GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Color(0xFF797979), fontWeight: FontWeight.w300 )),
      ),
      
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, )),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select role.';
        }
        return null;
      },
      onChanged: (value) {
        //Do something when selected item is changed.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
          //size: 30
        ),
        iconSize: 27,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key});

  @override

  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Select Brand',
      
    ];

    String? selectedValue;
    
    return DropdownButtonFormField2<String>(
      
      isExpanded: true,
      decoration: InputDecoration(
       
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        // Add more decoration..
      ),
      hint:  Text(
        'Select Brand',
        style:  GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Color(0xFF797979), fontWeight: FontWeight.w300 )),
      ),
      
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, )),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select role.';
        }
        return null;
      },
      onChanged: (value) {
        //Do something when selected item is changed.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
          //size: 30
        ),
        iconSize: 27,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}