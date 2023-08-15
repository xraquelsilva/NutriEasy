import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrieasy/screens/home-page.dart';
import 'package:nutrieasy/screens/login.dart';

class CheckPage extends StatefulWidget {
  const CheckPage ({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {

  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = FirebaseAuth.instance
      .authStateChanges()
      .listen((User?  user){
        if(user == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }else {
          FirebaseAuth.instance.signOut();
          //aqui vai a pagina principal
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
          // print('usuário logado');
        }
      });
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
        ),
    );
  }

}
