import 'dart:math';

import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/models/user_model.dart';
import 'package:classquest/services/auth.dart';
import 'package:classquest/views/dashboard_screen.dart';
import 'package:classquest/views/signup_screen.dart';
import 'package:classquest/widgets/form_widget.dart';
import 'package:classquest/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;
  bool isRemember = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future login() async {
    final isValidForm = _key.currentState!.validate();
    if (isValidForm) {
      setState(() {
        _isLoading = true;
      });
      await Auth().signIn(_emailController.text.trim(),
          _passwordController.text.trim(), context);

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _key,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(tBg),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(50),
              height: 725,
              width: 1170,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.black45,
                    width: 5,
                  )),
              child: Row(
                children: [
                  // Logo
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          tLogo,
                          width: 300,
                        ),
                        TextWidget(
                          label:
                              "A Student Portal Program Designed For Enjoyable Studying",
                          size: 24,
                        ),
                      ],
                    ),
                  ),

                  // Login
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              label: "Login",
                              size: 50,
                            ),
                            FormWidget(
                              label: "Email",
                              controller: _emailController,
                              icon: Icons.email,
                              validator: (value) => value != null &&
                                      !EmailValidator.validate(value)
                                  ? "Enter a valid email"
                                  : null,
                            ),
                            FormWidget(
                              label: "Password",
                              controller: _passwordController,
                              icon: Icons.lock,
                              isPass: true,
                              validator: (value) {
                                if (value != null && value.length < 6) {
                                  return "Enter min. 6 characters";
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: isRemember,
                                        onChanged: (value) {
                                          setState(() {
                                            isRemember = !isRemember;
                                          });
                                        }),
                                    TextWidget(
                                      label: "Remember Me",
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: TextWidget(label: "Forgot Password?"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: login,
                                child: _isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Colors.purpleAccent.shade200,
                                  elevation: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                },
                                child: TextWidget(
                                    label: "Don't have an account? Sign up")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
