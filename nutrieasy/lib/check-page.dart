import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrieasy/models/UserModel.dart';
import 'package:nutrieasy/screens/cardapio.dart';
import 'package:nutrieasy/screens/login.dart';

class CheckPage extends StatefulWidget {
  const CheckPage ({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {

  StreamSubscription? streamSubscription;
  UserModel? loggedUser;

  @override
  void initState() {
    super.initState();
    streamSubscription = FirebaseAuth.instance
      .authStateChanges()
      .listen((User?  user){
        if(user == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }else {
          loggedUser = UserModel(id: user.uid, username: user.displayName?? "");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cardapio()));
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
