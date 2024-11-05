import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDropdown extends StatefulWidget {
  const ProfileDropdown({super.key});

  @override
  State<ProfileDropdown> createState() => _ProfileDropdownState();
}

class _ProfileDropdownState extends State<ProfileDropdown> {
  Map<String, dynamic>? selectedItem;

  final List<Map<String, dynamic>> sampleItem = [
    {"title": "Profile", 'icon': 'assets/images/user.png'},
    {"title": "Setting", 'icon': 'assets/images/settings.png'},
    {"title": 'Logout', 'icon': 'assets/images/turn-off.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Map<String, dynamic>>(
         offset: const Offset(30, 45),
        color: Colors.white,
      onSelected: (Map<String, dynamic> item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) {
        return sampleItem.map<PopupMenuEntry<Map<String, dynamic>>>((item) {
          return PopupMenuItem<Map<String, dynamic>>(
            value: item,
            child: Row(
              children: [
                Image.asset(item['icon'], width: 20, height: 20,),
                const SizedBox(width: 15),
                Text(item['title'], style: GoogleFonts.lato(textStyle: 
            TextStyle(color: Colors.black)),),
              ],
            ),
          );
        }).toList();
      },
      child: Row(
        children: [
          if (selectedItem != null) ...[
            Image.asset(selectedItem!['icon'], width: 20, height: 20),
            const SizedBox(width: 8),
            Text(selectedItem!['title'], )
          ] else
             Image.asset('assets/images/person.png', width: 40, height: 40,)
        ],
      ),
    );
  }
}
