import 'package:conuhacks8/Authentication/AuthMethods.dart';
import 'package:conuhacks8/Authentication/loginPage.dart';
import 'package:flutter/material.dart';
import 'Widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _income = TextEditingController();

  bool isLoading = false;

  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _confirmPasswordController.dispose();
    _age.dispose();
    _city.dispose();
    _name.dispose();
    _income.dispose();
  }

  void signupUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      city: _city.text,
      income: _income.text,
      name: _name.text,
      age: _age.text,
    );

    if (res != 'success') {
      print("Error");
    } else {
      print("Sucess");
    }

    setState(() {
      isLoading = false;
    });
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const SizedBox(height: 50),
                TextFieldInput(
                  hintText: "Name",
                  textInputType: TextInputType.text,
                  textEditingController: _name,
                ),
                const SizedBox(height: 16),
                TextFieldInput(
                  hintText: "Username",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _usernameController,
                ),
                const SizedBox(height: 16),
                TextFieldInput(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(height: 16),
                TextFieldInput(
                  hintText: "Password",
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                ),
                const SizedBox(height: 16),
                TextFieldInput(
                  hintText: "Age",
                  textInputType: TextInputType.text,
                  textEditingController: _age,
                ),
                const SizedBox(height: 24),
                TextFieldInput(
                  hintText: "Income",
                  textInputType: TextInputType.text,
                  textEditingController: _income,
                ),
                const SizedBox(height: 24),
                TextFieldInput(
                  hintText: "City",
                  textInputType: TextInputType.text,
                  textEditingController: _city,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    signupUser();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ), backgroundColor: Colors.blue.shade900,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: navigateToSignUp,
                      child: const Text(" Log in",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
