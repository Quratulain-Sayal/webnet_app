import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override

  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Users',
      'Administrators',
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
        'All Users',
        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, )),
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



class Rowentries extends StatefulWidget {
  const Rowentries({super.key});

  @override
  State<Rowentries> createState() => _RowentriesState();
}

class _RowentriesState extends State<Rowentries> {
@override

Widget build(BuildContext context) {
  final List<String> items = [
  '10',
  '25',
  '50',
  '100'
];
String? selectedValue;

  return  DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint:  Text(
            'Show entries',
            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, fontSize: 14 )),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
           iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
          //size: 30
        ),
        iconSize: 20,
      ),
        ),
      );
    
  
}
}



