// ignore_for_file: sort_child_properties_last, use_build_context_synchronously
import 'dart:typed_data';
import 'package:conuhacks8/Authentication/AuthMethods.dart';
import 'package:conuhacks8/Authentication/signup.dart';
import 'package:conuhacks8/Authentication/utlis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'Widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    setState(() {
      _isLoading = false;
    });

    if (res == 'success') {
      print("logged in");
    } else {
      showSnackBar(res, context);
    }
  }

  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade800,
              Colors.yellow.shade600,
              Colors.yellow.shade400
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Container(), flex: 2),
                    // svg image
                    SvgPicture.asset('assets/ic_instagram.svg',
                        color: Colors.yellow, height: 64),
                    const SizedBox(height: 64),
                    //text field input for email
                    TextFieldInput(
                      hintText: "Enter you email",
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // text field for password
                    TextFieldInput(
                      hintText: "Enter you password",
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      isPass: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // button for login
                    InkWell(
                      onTap: loginUser,
                      child: Container(
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white))
                            : const Text('Log in'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            color: Colors.blue),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(child: Container(), flex: 2),
                    // transition to sign up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: const Text("Don't have an account?"),
                        ),
                        GestureDetector(
                          onTap: navigateToSignUp,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: const Text("Sign up.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    )
                  ])),
        ),
      ),
    );
  }
}
