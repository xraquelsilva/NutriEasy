
// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

bool botao1select = true;
bool botao2select = false;

final _firebaseAuth = FirebaseAuth.instance;
class _PerfilPageState extends State<PerfilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomLeft,
            icon: Icon(Icons.arrow_back),
            color: Colors.black54,
            onPressed: () {
            },
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
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
      body: Column(
        children: [
          SizedBox(
            child: Container(
              alignment: Alignment.topCenter,

            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text(
              '${_firebaseAuth.currentUser!.displayName}',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'PublicSans',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 0.680),
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          SizedBox(
            child: Text(
              '${_firebaseAuth.currentUser!.email}',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'PublicSans',
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(0, 0, 0, 0.680),
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 30,
            width: 309,
            decoration: BoxDecoration(
                color: Color(0xFFDE7047),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      botao1select = true;
                      botao2select = false;
                    });
                  },
                  elevation: 0,
                  label: const Text('Meu corpo'),
                  backgroundColor:
                      botao1select ? Color(0xFFE9573F) : Color(0xFFDE7047),
                  foregroundColor: Colors.white,
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      botao1select = false;
                      botao2select = true;
                    });
                  },
                  elevation: 0,
                  label: const Text('Minhas informacoes'),
                  backgroundColor:
                      botao2select ? Color(0xFFE9573F) : Color(0xFFDE7047),
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 17,
          ),
          if (botao1select) screen1(context),
          if (botao2select) screen2(context),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

Widget buildTable2() {
  List<TabelaItem2> tabelaDados2 = [
    TabelaItem2(
      titulo: 'Peso',
      valor: '-----',
    ),
    TabelaItem2(titulo: 'Calorias', valor: '-----'),
    TabelaItem2(titulo: 'Taxa de gordura', valor: '-----'),
  ];

  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 0.8),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 0,
      child: Column(
        children: [
          for (var i = 0; i < tabelaDados2.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tabelaDados2[i].titulo,
                      style: TextStyle(fontSize: 14, fontFamily: 'PublicSans')),
                  Text(tabelaDados2[i].valor),
                ],
              ),
            ),
            if (i < tabelaDados2.length - 1)
              Divider(height: 1, color: Colors.blueGrey),
          ],
        ],
      ),
    ),
  );
}

class TabelaItem2 {
  final String titulo;
  final String valor;

  TabelaItem2({required this.titulo, required this.valor});
}






Widget buildTable() {
  List<TabelaItem> tabelaDados1 = [
    TabelaItem(titulo: 'Peso', valor: '-----'),
    TabelaItem(titulo: 'Altura', valor: '-----'),
    TabelaItem(titulo: 'IMC', valor: '-----'),
    TabelaItem(titulo: 'Taxa de gordura', valor: '-----')
  ];

  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 0.8),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 0,
      child: Column(
        children: [
          for (var i = 0; i < tabelaDados1.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tabelaDados1[i].titulo,
                      style: TextStyle(fontSize: 14, fontFamily: 'PublicSans')),
                  Text(tabelaDados1[i].valor),
                ],
              ),
            ),
            if (i < tabelaDados1.length - 1)
              Divider(height: 1, color: Colors.blueGrey),
          ],
        ],
      ),
    ),
  );
}

class TabelaItem {
  final String titulo;
  String valor;

  TabelaItem({required this.titulo, required this.valor});
}

Widget screen1(context) {
  return Column(
    children: [
      SizedBox(
        child: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 145,
            child: buildTable(),
          ),
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 45),
          child: Text(
            'Metas',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 0, 0.680),
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      SizedBox(height: 15),
      SizedBox(
        child: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 115,
            child: buildTable2(),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        height: 35,
        width: 130,
        child: FloatingActionButton.extended(
          onPressed: () {
            setState() {}
          },
          elevation: 0,
          label: const Text('Atualizar'),
          backgroundColor: Color(0xFF528540),
        ),
      )
    ],
  );
}

Widget buildTable3() {
  List<TabelaItem> tabelaDados3 = [
    TabelaItem(titulo: 'Objetivo', valor: '-----'),
    TabelaItem(titulo: 'Sexo', valor: '-----'),
    TabelaItem(titulo: 'Nascimento', valor:'-----'),
    TabelaItem(titulo: 'Senha', valor: '*******')
  ];

  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 0.8),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Card(
      elevation: 0,
      child: Column(
        children: [
          for (var i = 0; i < tabelaDados3.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tabelaDados3[i].titulo,
                      style: TextStyle(fontSize: 14, fontFamily: 'PublicSans')),
                  Text(tabelaDados3[i].valor),
                ],
              ),
            ),
            if (i < tabelaDados3.length - 1)
              Divider(height: 1, color: Colors.blueGrey),
          ],
        ],
      ),
    ),
  );
}

class TabelaItem3 {
  final String titulo;
  String valor;

  TabelaItem3({required this.titulo, required this.valor});
}

Widget screen2(context) {
  return Column(
    children: [
      SizedBox(
        child: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 145,
            child: buildTable3(),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        height: 35,
        width: 130,
        child: FloatingActionButton.extended(
          onPressed: () {
          },
          elevation: 0,
          label: const Text('Atualizar'),
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF528540),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Color(0xFF528540), width: 2)),
        ),
      )
    ],
  );
}
