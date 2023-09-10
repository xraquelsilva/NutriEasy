// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrieasy/screens/login.dart';
import 'package:nutrieasy/screens/navbar.dart';
import '../check-page.dart';
import 'refeicao.dart';
import 'substrefs.dart';





//import 'perfil.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});
  

  @override
  _Cardapiostate createState() => _Cardapiostate();
}

class _Cardapiostate extends State<Cardapio> {
  final _firebaseAuth = FirebaseAuth.instance;

  String? selectedDate;
  String dia = '';

  final dropvalue = ValueNotifier('');
  List<String> dropOpcoes = [
    'hoje',
    '16/08',
    '17/08',
    '18/08',
    '19/08',
    '20/08'
  ];

  

  final cafedamanha = 'Café da manhã';
  final lanchedamanha = 'Lanche da manhã';
  final almoco = 'Almoço';
  final lanchedatarde = 'Lanche da tarde';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Cardápio',
              style: TextStyle(
                color: Color.fromARGB(176, 0, 0, 0),
                fontSize: 18,
                fontFamily: 'Public Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ),
          ),
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            icon: Icon(Icons.arrow_back),
            color: const Color.fromARGB(171, 0, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFCDDE47),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 115,
              height: 28,
              child: ValueListenableBuilder(
                valueListenable: dropvalue,
                builder: (BuildContext context, String value, _) {
                  return DropdownButtonFormField<String>(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    elevation: 0,
                    isExpanded: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: -10, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Color(0xFF528540)))),
                    isDense: false,
                    hint: Text('Dia'),
                    value: (value.isEmpty) ? selectedDate : value,
                    onChanged: (escolha) {
                      setState(() {
                        selectedDate = escolha;
                      });
                      dropvalue.value = escolha.toString();
                    },
                    items: dropOpcoes
                        .map(
                          (op) => DropdownMenuItem(
                            value: op,
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  op,
                                )),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
           
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: dropOpcoes.map((op) {
                String diaOpcao = op.split('/')[0]; // Extrai o dia da opção
                bool isSelected = op == selectedDate;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = op;
                    });
                    dropvalue.value = op;
                    dia = op.split('/')[0];
                  },
                  child: Container(
                    width: screenWidth * 0.09,
                    height: screenWidth * 0.09,
                    margin: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Color(0xFF528540) : Colors.white,
                        border: Border.all(color: Color(0xFF528540))),
                    child: Center(
                      child: Text(
                        diaOpcao,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Color(0xFF528540),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Public Sans',
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              width: 350,
              child: GestureDetector(
                  onTap: () {
                    if (dia == Null || dia.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text('Alerta!'),
                                content: Text('Selecione uma data'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Fechar'))
                                ]);
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Refeicaodetalhes(
                                  titulo: cafedamanha, data: dia,index: 0,)));
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 252, 252, 252).withOpacity(0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment
                              .topCenter, // Posição inicial do gradiente
                          end: Alignment
                              .bottomCenter, // Posição final do gradiente
                          stops: [
                            0.0,
                            0.6
                          ], // Pode ajustar os pontos de parada conforme necessário
                          tileMode: TileMode.clamp,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ref3.png'),
                          fit: BoxFit.cover,
                        )),
                    child: SizedBox(
                      height: 70,
                      width: 350,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            cafedamanha,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(74, 74, 74, 1),
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              width: 350,
              child: GestureDetector(
                  onTap: () {
                    if (dia == Null || dia.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text('Alerta!'),
                                content: Text('Selecione uma data'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Fechar'))
                                ]);
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Refeicaodetalhes(
                                  titulo: lanchedamanha, data: dia,index: 1,)));
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 252, 252, 252).withOpacity(0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment
                              .topCenter, // Posição inicial do gradiente
                          end: Alignment
                              .bottomCenter, // Posição final do gradiente
                          stops: [
                            0.0,
                            0.6
                          ], // Pode ajustar os pontos de parada conforme necessário
                          tileMode: TileMode.clamp,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ref4.png'),
                          fit: BoxFit.cover,
                        )),
                    child: SizedBox(
                      height: 70,
                      width: 350,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Lanche da manhã',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(74, 74, 74, 1),
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              width: 350,
              child: GestureDetector(
                  onTap: () {
                    if (dia == Null || dia.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text('Alerta!'),
                                content: Text('Selecione uma data'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Fechar'))
                                ]);
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Refeicaodetalhes(
                                  titulo: almoco, data: dia,index: 2,)));
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 252, 252, 252).withOpacity(0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment
                              .topCenter, // Posição inicial do gradiente
                          end: Alignment
                              .bottomCenter, // Posição final do gradiente
                          stops: [
                            0.0,
                            0.6
                          ], // Pode ajustar os pontos de parada conforme necessário
                          tileMode: TileMode.clamp,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ref1.png'),
                          fit: BoxFit.cover,
                        )),
                    child: SizedBox(
                      height: 70,
                      width: 350,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Almoço',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(74, 74, 74, 1),
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              width: 350,
              child: GestureDetector(
                  onTap: () {
                    if (dia == Null || dia.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text('Alerta!'),
                                content: Text('Selecione uma data'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Fechar'))
                                ]);
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Refeicaodetalhes(
                                  titulo: lanchedatarde, data: dia,index: 1,)));
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 252, 252, 252).withOpacity(0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment
                              .topCenter, // Posição inicial do gradiente
                          end: Alignment
                              .bottomCenter, // Posição final do gradiente
                          stops: [
                            0.0,
                            0.6
                          ], // Pode ajustar os pontos de parada conforme necessário
                          tileMode: TileMode.clamp,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/ref2.png'),
                          fit: BoxFit.cover,
                        )),
                    child: SizedBox(
                      height: 70,
                      width: 350,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Lanche da tarde',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(74, 74, 74, 1),
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            TextButton(
              onPressed: () {
                logout();
              }, 
              child: Text('Sair')
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomTabBar(),
    );
  }

  logout () async {
    await _firebaseAuth.signOut().then(
      (user) => Navigator.pushReplacement(
        context as BuildContext, 
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
          ),
        ),
    );

  }
}





