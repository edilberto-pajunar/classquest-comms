import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/models/user_model.dart';
import 'package:classquest/services/auth.dart';
import 'package:classquest/views/login_screen.dart';
import 'package:classquest/widgets/form_widget.dart';
import 'package:classquest/widgets/text_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUp() async {
    final isValidForm = _key.currentState!.validate();
    if (isValidForm) {
      setState(() {
        _isLoading = true;
      });
      await Auth().signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _usernameController.text.trim(),
          context);
      setState(() {
        _isLoading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              width: 500,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo

                  // Login
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
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
                            validator: (value) =>
                                value != null && !EmailValidator.validate(value)
                                    ? "Enter a valid email"
                                    : null,
                          ),
                          FormWidget(
                            label: "Username",
                            controller: _usernameController,
                            icon: Icons.people_rounded,
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
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: signUp,
                              child: _isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Signup",
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
                            height: 5,
                          ),
                          InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              child: TextWidget(
                                  label: "Already have an account? Sign in")),
                        ],
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
