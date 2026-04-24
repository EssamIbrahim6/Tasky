import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';
import 'package:tasky/home/screens/home_screen.dart';

import '/core/utils/validator_app.dart';
import '../widgets/main_buttom_widget.dart';

import '/auth/widgets/text_form_filde_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fullName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  bool _isChecked = false;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 20),

                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainTextColor,
                  ),
                ),

                SizedBox(height: 80),
                Text(
                  "Full Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondTextColor,
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: fullName,
                  hintText: "Enter your Name",
                  validator: ValidatorApp.validateName,
                  icon: Icons.person,
                ),
                SizedBox(height: 12),
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
                  icon: Icons.email,
                ),
                SizedBox(height: 12),
                Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondTextColor,
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: phone,
                  hintText: "Enter your phone",
                  validator: ValidatorApp.validatePhoneNumber,
                  icon: Icons.phone_android_outlined,
                ),
                SizedBox(height: 12),
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
                SizedBox(height: 12),
                Text(
                  "confirm Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondTextColor,
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: confirmPassword,
                  hintText: "Enter your Confirm Password",
                  isObscure: true,
                  icon: Icons.visibility,
                  validator: (value) => ValidatorApp.validateConfirmPassword(
                    value,
                    password.text,
                  ),
                ),

                SizedBox(height: 10),
                MainButtomWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Perform login
                        register(email: email.text, password: password.text, context: context);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  text: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account ?",
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
                        onTap: () {
                          Navigator.of(context).pop();
                        },

                        child: Text(
                          "Login now",
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
              ],
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Future<void> register({required String email, required String password , required BuildContext context}) async {
   showLoginDialog(context);
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.of(context).pop();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      log('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      log('The account already exists for that email.');
    }
  } catch (e) {
    log(e.toString());
  }
}



void showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Login'),
      content: Text('Login successful!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),
      ],
    ),
  );
}