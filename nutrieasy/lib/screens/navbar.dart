// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nutrieasy/screens/cardapio.dart';
import 'package:nutrieasy/screens/home-page.dart';
import 'perfil.dart';

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => Navibar();
}

class Navibar extends State<BottomTabBar> {
  int _index = 0;
  final screens = [
    PerfilPage(),
    Cardapio(),
    // PerfilPage()
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
              icon: ImageIcon(
                AssetImage('assets/images/perfil-de-usuario.png'),
                size: 25,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/botao-de-inicio.png'),
                size: 40,
              ),
              label: ''),
        ],
        selectedIconTheme: IconThemeData(color: Color(0xFF528540)),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
