// ignore_for_file: avoid_print, must_be_immutable

import 'package:firebase_app/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/components/component.dart';
import '../home/home_page_screen.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);


  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsetsDirectional.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 75,
                      child: Container(
                        decoration: const BoxDecoration(
                          image:DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.cover,
                          ) ,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'REGISTER',
                    style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 22.5),
                  ),
                  const Text(
                    'Enter your personal information.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///username
                  const Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFormField(
                    controller: usernameController,
                    text: 'Enter your username',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Username should be filled";
                      }
                      return null;
                    },
                    type: TextInputType.name,
                    preIcon: Icons.person,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///email
                  const Text(
                    'E-mail Address',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFormField(
                    controller: emailController,
                    text: 'Enter your e-mail address',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "E-mail should be filled";
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                    preIcon: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ///password
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFormField(
                      controller: passwordController,
                      text: 'Enter your password',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password should be filled";
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      preIcon: Icons.lock,
                      suffIcon: Icons.visibility_off_rounded,
                      isPass: true,
                      suffixPressed: () {},
                      onSubmit: (value) {}),
                  const SizedBox(
                    height: 25,
                  ),
                  ///confirm password
                  const Text(
                    'Confirm Password',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFormField(
                      controller: confirmPasswordController,
                      text: 'Enter confirm password',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return " Confirm password should be filled";
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      preIcon: Icons.lock,
                      suffIcon: Icons.visibility_off_rounded,
                      isPass: true,
                      suffixPressed: () {},
                      onSubmit: (value) {}),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultButton(
                      text: 'Register',
                    function: () async {
                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        // ignore: use_build_context_synchronously
                        navigateAndFinish(context,const HomePageScreen());
                      }
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ?',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(width: 5,),
                      textButton(
                        text: 'Login',
                        textColor: Colors.blue,
                        size: 15,
                        function: () {
                          navigateTo(context, LoginScreen());
                        },
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
