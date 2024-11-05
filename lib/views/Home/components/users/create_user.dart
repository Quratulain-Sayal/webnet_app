import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
//import 'package:webnet_app/views/Dashboard/components/header.dart';
//import 'package:webnet_cms/views/Dashboard/dashboardscreen.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:webnet_app/views/Home/components/users/userslist.dart';

class CreateUser extends StatefulWidget {
  final int? userId;
  const CreateUser({super.key, this.userId});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String phone = '';
  String role = '';
  String country = '';
  String city = '';
  String postal = '';
  String address = '';
  String DOB = '';

  TextEditingController _passwordController = TextEditingController();
  String? _selectedRole; 
  List<String> _roles = ['Administrator'];
  bool _isDropdownOpened = false;
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    if (widget.userId != null) {
      _fetchUserData(widget.userId!);
    }
  }

  Future<void> _fetchUserData(int userId) async {
    final response =
        await http.get(Uri.parse('http://api.test/api/users'));
    if (response.statusCode == 200) {
      final user = json.decode(response.body);
      setState(() {
        firstName = user['first_name'];
        lastName = user['last_name'];
        email = user['email'];
        password = user['password'];
        phone = user['phone'];
        role = user['userType'];
        DOB = user['dob'];
        address = user['address'];
        city = user['city'];
        country = user['country'];
        postal = user['postal'];
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

Future<void> _submitForm() async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    print('Form is valid');

    try {
      final response = widget.userId != null
          ? await http.put(
              Uri.parse('http://api.test/api/users/${widget.userId}'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode({
                'first_name': firstName,
                'last_name': lastName,
                'email': email,
                'phone': phone,
                'role': role,
                'dob': DOB,
                'address': address,
                'city': city,
                'country': country,
                'postal': postal,
              }),
            )
          : await http.post(
              Uri.parse('http://api.test/api/users'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode({
                'first_name': firstName,
                'last_name': lastName,
                'email': email,
                'phone': phone,
                'role': role,
                'dob': DOB,
                'address': address,
                'city': city,
                'country': country,
                'postal': postal,
              }),
            );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Form submitted successfully!',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(16.0),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {
                print('Undo action pressed');
              },
            ),
          ),
        );

        // Navigate to SubmittedUserTable after successful form submission
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Userslist(),
          ),
        );
      } else {
        // Handle HTTP response error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Failed to save user data. Please try again.',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(16.0),
            behavior: SnackBarBehavior.floating,
          ),
        );
        throw Exception('Failed to save user data');
      }
    } catch (e) {
      // Handle any other errors (e.g., network issues)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'An error occurred: $e',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(16.0),
          behavior: SnackBarBehavior.floating,
        ),
      );
      print('Exception caught: $e');
    }
  }
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF770099),
        actions: const [
          Row(
            children: [
            //  Notifications(),
              SizedBox(width: 10),
            //  ProfileCard(),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: defaultpadding2, vertical: defaultpadding3),
              child: Column(
                children: [
                  SizedBox(
                    height: defaultpadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add User",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF505458),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    // thickness: 2,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          //height: screenHeight * 0.50,
                          width: screenWidth,
                          child: Card(
                            elevation: 1,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth,
                                  height: screenHeight * 0.06,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF188AE2),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('USER INFORMATION',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Name',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: firstName,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'First Name',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            //color: Color(0xFF797979),
                                          ),
                                          //fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      firstName = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                    initialValue: lastName,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Last Name',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            //color: Color(0xFF797979),
                                          ),
                                          //fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      lastName = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Email',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: email,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Email',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,p
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      email = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Password',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: password,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Password',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      password = value!;
                                    },
                                    obscureText: true, // Hide password input
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            // Rounded corners
                                          ),
                                          // contentPadding: EdgeInsets.all(10),
                                          backgroundColor: Colors.white,
                                          child: Container(
                                            width: screenWidth * 1,
                                            height: screenHeight * 0.25,
                                            padding:
                                                EdgeInsets.all(defaultpadding),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // TextField to enter or display password
                                                TextField(
                                                  controller:
                                                      _passwordController,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Colors.grey.shade200,
                                                    filled: true,
                                                    hintText: '',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        20), // Add spacing between TextField and buttons
                                                // Row with two buttons (Generate Password and Use Password)
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Generate Password button
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // Simulate password generation
                                                        _passwordController
                                                            .text = '';
                                                      },
                                                      child: Text(
                                                        'Generate',
                                                        style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(0xFF188AE3),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2))),
                                                    ),
                                                    // Use Password button
                                                    //  SizedBox(width: 3),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          'Use Password',
                                                          style:
                                                              GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF188AE3),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)))),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Generate password',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF337AB7),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Phone',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: phone,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Phone',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      phone = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your phone number';
                                      } else if (!RegExp(r'^\+?[0-9]{10,15}$')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'User Group',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20.0),
                                  child: DropdownButtonFormField<String>(
                                    value:
                                        _selectedRole, 
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Select Role',
                                        style: GoogleFonts.lato(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                      
                                      suffixIcon: Icon(
                                        _isDropdownOpened
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down,
                                      ),
                                    ),
                                    items: _roles.map((String role) {
                                      return DropdownMenuItem<String>(
                                        value: role,
                                        child: Text(
                                          role,
                                          style: GoogleFonts.lato(
                                            textStyle:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      );
                                    }).toList(),

                                  
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedRole = value;
                                        _isDropdownOpened = false;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a role';
                                      }
                                      return null;
                                    },
 
                                    onTap: () {
                                      setState(() {
                                        _isDropdownOpened = !_isDropdownOpened;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Date of Birth',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: DOB,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'DOB',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      DOB = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your date of birth';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Address',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: address,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Address',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      address = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Adress is a required field';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'City',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: city,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'City',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Country',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: country,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Country',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Postal',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF797979),
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextFormField(
                                    initialValue: postal,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Postal',
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            // color: Color(0xFF797979),
                                          ),
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue.shade200),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFe3e3e3),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          // height: screenHeight * 0.10,
                          width: screenWidth * 1,
                          child: Card(
                              elevation: 1,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Active',
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF797979),
                                            ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            isChecked
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank, 
                                            color: isChecked
                                                ? Colors.green
                                                : Color(
                                                    0xFF797979), 
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isChecked =
                                                  !isChecked; 
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context, 
                                            MaterialPageRoute(builder: (context)=> Userslist()));
                                          },
                                          child: Text(
                                            'Back',
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF188AE2),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1))),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.02,
                                        ),
                                        ElevatedButton(
                                          onPressed: _submitForm,
                                          child: Text(
                                            'Save',
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF4bd396),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1))),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ])),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    // thickness: 2,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    '2024 © Webnet Pakistan.',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16, color: Color(0xFF797979))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomNavigationBar(
              backgroundColor: const Color(0xFFF4F6F8),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/side nav icons/dashboard-layout-svgrepo-com.svg",
                    height: 18,
                    width: 18,
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF782572), BlendMode.srcIn),
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/side nav icons/category-svgrepo-com.svg",
                    height: 18,
                    width: 18,
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF782572), BlendMode.srcIn),
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/side nav icons/settings-svgrepo-com.svg",
                    height: 18,
                    width: 18,
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF782572), BlendMode.srcIn),
                  ),
                  label: 'Settings',
                ),
              ],
              currentIndex: 0, 
              selectedItemColor: const Color(0xFF505458), 
              unselectedItemColor:
                  const Color(0xFF505458),
              showSelectedLabels: true, 
              showUnselectedLabels: true, 
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'Lato', 
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF505458),
                  fontSize: 12 
                  ),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Lato',
                  color: Color(0xFF505458),
                  fontWeight: FontWeight.w400,
                  fontSize: 12 
                  ),
              onTap: (index) {
                
              },
            )
          : null, 
    ));
  }
}
