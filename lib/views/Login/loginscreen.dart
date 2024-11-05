import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/views/Home/home_screen.dart';
import 'package:webnet_app/views/Login/components/login_components.dart';



class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const MobileLoginScreen(),
      //tablet: TabletLoginScreen(),
      desktop: DesktopLoginScreen(),
    );
  }
}

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<MobileLoginScreen> {
  // controllers for user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Global key for form validation
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;
  bool _isPasswordVisible = false; // initially password is hidden

  // Email validation
  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = 'Email is required';
      } else {
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (!emailRegex.hasMatch(value)) {
          _emailError = 'Enter a valid email address';
        } else {
          _emailError = null;
        }
      }
    });
  }

  // Password validation
  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordError = 'Password is required';
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(defaultpadding),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(),
                  SizedBox(
                      height: screenHeight * 0.10), // 5% of the screen height
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(
                        Icons.mail,
                      ),
                      errorText: _emailError,
                      labelStyle: const TextStyle(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      //  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      _validateEmail(value); // Validate while typing
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                     obscureText: !_isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons
                                  .visibility // If visible, show "visibility" icon
                              : Icons
                                  .visibility_off, // If hidden, show "visibility off" icon
                        ),
                        onPressed: () {
                          setState(() {
                             _isPasswordVisible = !_isPasswordVisible; // Toggle visibility state
                          });
                        },
                      ),

                      errorText: _passwordError,
                      labelStyle: const TextStyle(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      //  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      _validatePassword(value); // Validate while typing
                    },
                  ),
                  // SizedBox(height: screenHeight * 0.02),  // 2% of the screen height
                  ForgetPassword(),
                  SizedBox(
                      height: screenHeight * 0.05), // 2% of the screen height
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _validateAndSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color

                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15), // Padding
                        elevation: 5, // Shadow or elevation of the button
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight * 0.02), // 2% of the screen height
                  RegistrationText(),
                ],
              ),
            ),
          ),
        ));
  }

  void _validateAndSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid
      ScaffoldMessenger.of(context).showSnackBar(
       const  SnackBar(
          content: Text('Login successful'),
          backgroundColor: Colors.green,
        ),
      );
      final email = _emailController.text;
      final password = _passwordController.text;
      print('Email: $email');
      print('Password: $password');

      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  Homepage()),
    );
    } else {
      // Form is not valid, show error message
      ScaffoldMessenger.of(context).showSnackBar(
       const  SnackBar(
          content: Text('Please fill the required fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class DesktopLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
