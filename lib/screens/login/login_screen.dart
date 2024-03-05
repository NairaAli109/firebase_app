import 'package:firebase_app/shared/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import '../home/home_page_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    'LOGIN',
                    style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 22.5),
                  ),
                  const Text(
                    'Login to continue using the app.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'E-mail Address',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFormField(
                    controller: emailController,
                    text: 'E-mail',
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
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFormField(
                      controller: passwordController,
                      text: 'Password',
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
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      textButton(
                        text: 'Forgot your password?',
                        textColor: Colors.grey,
                        size: 14,
                        function: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultButton(
                      text: 'Login',
                    function: () {
                      navigateAndFinish(context,const HomePageScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey),
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Or Login with',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child:iconButton(
                          context: context,
                          icon: ButtonType.facebook,
                          function: (){}
                          )
                      ),
                      Expanded(
                          child:iconButton(
                              context: context,
                              icon: ButtonType.google,
                              function: (){}
                          )
                      ),
                      Expanded(
                          child:iconButton(
                              context: context,
                              icon: ButtonType.apple,
                              function: (){}
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(width: 5,),
                      textButton(
                        text: 'Register',
                        textColor: Colors.blue,
                        size: 15,
                        function: () {
                          navigateTo(context,  RegisterScreen());
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
