// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_app/screens/login/login_screen.dart';
import 'package:firebase_app/shared/components/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App'),
        actions: [
          IconButton(
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                print(':::::::::::::::::::::::::::::::::::: SIGN OUT ');
                navigateAndFinish(context, LoginScreen());
              },
              icon: const Icon(Icons.exit_to_app_outlined,color: Colors.redAccent,)
          )
        ],
      ),
    );
  }
}
