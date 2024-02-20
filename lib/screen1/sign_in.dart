// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_donation/resourses/authenticatuon.dart';
import 'package:food_donation/screen/Widgets/custom_main.dart';
import 'package:food_donation/screen/Widgets/text_field.dart';
import 'package:food_donation/screen1/second_screen.dart';
import 'package:food_donation/screen1/sign_up.dart';
import 'package:food_donation/utils/utils.dart';

import '../layout/screen_layout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/signupp.png'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFB200),
                Color(0xffFEB139),
                Color(0xffFFDE00),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Image.asset(
                  "images/text.png",
                  height: screenSize.height * 0.4,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SecondScreen();
                                  },
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 48),
                          const Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        title: "Email",
                        controller: emailController,
                        obscureText: false,
                        hintText: "Enter your email",
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        title: "Password",
                        controller: passwordController,
                        obscureText: true,
                        hintText: "Enter your password",
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: CustomMainButton(
                          color: const Color.fromARGB(255, 246, 193, 79),
                          isLoading: isLoading,
                          onPressed: () async {
                            setState(() {
                              //isLoading = false;
                              isLoading = true;
                            });

                            String output =
                                await authenticationMethods.signInUser(
                                    email: emailController.text,
                                    password: passwordController.text);

                            if (output == "success") {
                              //functions
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScreenLayout(),
                                ),
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Utils().showSnackBar(
                                context: context,
                                content: output,
                              );
                            }
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                letterSpacing: 0.6, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "New to Feed Forward?",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: CustomMainButton(
                          color: Colors.grey[400]!,
                          isLoading: false,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Create an Donation Account",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
