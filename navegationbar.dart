// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'perfil.dart';
import 'homepage.dart';



class BottomTabBar1 extends StatefulWidget{
  BottomTabBar1({Key? key}) : super(key: key);

  @override
  State<BottomTabBar1> createState() => Navibar();
}





class Navibar extends State<BottomTabBar1>{  


  int _index = 0;
  final screens = [
    PerfilPage(),
    HomePage(),
    PerfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        backgroundColor: Colors.white,
        items: [
          
          BottomNavigationBarItem(
            
            icon:ImageIcon(
              AssetImage('assets/nutri_img/perfilnavi.png'),
              size: 30,) ,
              label: ''
          ),


          
          BottomNavigationBarItem(
            icon:ImageIcon(
              AssetImage('assets/nutri_img/casanav.png'),
              size: 40,) ,
              label: ''
          ),


           BottomNavigationBarItem(
            icon:ImageIcon(
              AssetImage('assets/nutri_img/evonavi.png'),
              size: 30,) ,
              label: ''
        )],
        elevation: 0,),
        backgroundColor: Colors.white,);
}

}