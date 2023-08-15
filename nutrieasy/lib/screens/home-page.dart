// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../check-page.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _firebaseAuth = FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Home page', textAlign: TextAlign.center,),
          TextButton(
            onPressed: () {
              logout();
            }, 
            child: Text('Sair')
          )
        ],
      ),
    );
  }

  logout () async {
    await _firebaseAuth.signOut().then(
      (user) => Navigator.pushReplacement(
        context as BuildContext, 
        MaterialPageRoute(
          builder: (context) => const CheckPage(),
          ),
        ),
    );

  }
}

