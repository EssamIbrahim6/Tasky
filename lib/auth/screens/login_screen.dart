// import 'package:app6/auth/regester_screen.dart';

import 'package:flutter/material.dart';
import 'package:tasky/auth/screens/register_screen.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/home/screens/home_screen.dart';

import '/core/utils/validator_app.dart';
import '../widgets/main_buttom_widget.dart';

import '/auth/widgets/text_form_filde_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                SizedBox(height: 20),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainTextColor,
                  ),
                ),

                SizedBox(height: 80),

                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondTextColor,
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: email,
                  hintText: "Enter your email",

                  validator: ValidatorApp.validateEmail,
                  icon: Icons.email_outlined,
                ),

                SizedBox(height: 30),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondTextColor,
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: password,
                  hintText: "Enter your Password",
                  validator: ValidatorApp.validatePassword,
                  isObscure: true,
                  icon: Icons.visibility,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [],
                // ),
                SizedBox(height: 30),
                MainButtomWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {

                      // Perform login
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  text: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
      



      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: .min,
          children: [
            SizedBox(height: 14),
            // MaterialButton(
            //   minWidth: double.infinity,
            //   height: 50,
            //   color: Color(0xFFFF3951),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   onPressed: () {
            //     // if (formKey.currentState!.validate()) {
            //     //   // Perform login
            //     // }
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => AppSectionViwe(),
            //       ),
            //     );
            //   },
            //   child: Text("Next >"),
            // ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff252525),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to sign up screen
                  },
                  child: GestureDetector(
                   onTap:(){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                   },
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
