import 'package:flutter/material.dart';
import '../prefsUser.dart';
import '../Widgets/signUpField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hiddenPassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text('Please fill all field')));
      return;
    }


    await PrefsUser.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account created successfully')),);

    Navigator.pushReplacementNamed(context, '/loginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Image.asset("images/sing.png", fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create your account",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Expanded(
                            child: SingUpField(
                              hint: "First Name",
                              controller: firstNameController,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: SingUpField(
                              hint: "Last Name",
                              controller: lastNameController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SingUpField(
                          hint: "Email",
                          controller: emailController
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: hiddenPassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hiddenPassword = !hiddenPassword;
                              });
                            },
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Color(0xffF4B844),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Color(0xffF4B844),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          "By tapping Sign up you accept all our ",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "terms ",
                                style: TextStyle(
                                  color: Color(0xffF4B844),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "and ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: "condition",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffF4B844),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed:createAccount,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF4B844),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          child:Text(
                                  "CREATE AN ACCOUNT",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    letterSpacing: 0.5,
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
        ],
      ),
    );
  }
}
