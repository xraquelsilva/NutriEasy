import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrieasy/models/RefeicaoOptionModel.dart';
import 'dart:math';

import '../controllers/MealController.dart';

class RefeicaoDetalhes extends StatefulWidget {
  final String titulo;
  final String data;
  final int index;

  RefeicaoDetalhes({
    required this.titulo,
    required this.data,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<RefeicaoDetalhes> createState() => _RefeicaoDetalhesState();
}

class _RefeicaoDetalhesState extends State<RefeicaoDetalhes> {
  final _firebaseAuth = FirebaseAuth.instance;
  late MealController _controller;
  List<RefeicaoOptionModel> opcoesRefeicao = [];
  RefeicaoOptionModel? selectedOption; // Guarda a opção selecionada no DropdownButton

  @override
  void initState() {
    super.initState();
    _controller = MealController();
    _loadMealOptions(false); // Carrega as opções quando a página é iniciada
  }

  Future<void> _loadMealOptions(bool update) async {
    String userId = _firebaseAuth.currentUser!.uid;
    String mealName = widget.titulo;

    try {
      opcoesRefeicao = 
          await _controller.findMealOptions(userId, mealName, update);

      setState(() {
        // List<Object> opcoesRefeicao = mealOptions;
        selectedOption = null; // Limpa a opção selecionada
      });
    } catch (e) {
      print('Erro ao carregar opções de refeição: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              widget.titulo,
              style: const TextStyle(
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
            padding: const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(171, 0, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFCDDE47),
                  Colors.white, // Corrigido: era "Colors white"
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF528540),
                ),
                child: Center(
                  child: Text(
                    widget.data,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 1.2,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < opcoesRefeicao.length; i++)
                      buildTextWithPadding(opcoesRefeicao[i].name),
                    const SizedBox(
                      height: 75,
                    ),
                    const Text(
                      'Selecione uma opção',
                      style: TextStyle(
                        color: Color.fromARGB(176, 0, 0, 0),
                        fontSize: 15,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color(0xFF528540),
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton<RefeicaoOptionModel>(
                      value: selectedOption,
                      onChanged: (newValue) {
                        setState(() {
                          selectedOption = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text("Selecione uma opção"),
                        ),
                        for (var option in opcoesRefeicao)
                          DropdownMenuItem(
                            value: option,
                            child: Text(option.name),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextWithPadding(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
        ),
      ),
    );
  }
}
