import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

// webnet logo
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/images/logo-light.png'));
  }
}


// forgetpassword
class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: (
              // forget password functionality
              ) {},
          child: Text(
            'forgot password',
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline)),
          )),
    );
  }
}



class RegistrationText extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Signup',
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue)),
          ),
        )
      ],
    );
  }
}
