// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const PrimeiraRota(),
  ));
}

class PrimeiraRota extends StatefulWidget {
  const PrimeiraRota({Key? key}) : super(key: key);

  @override
  _PrimeiraRotaState createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 303,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Insira seu email',
                    hintStyle: TextStyle(
                      color: Color(0xFF919191),
                      fontSize: 12,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.72,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF528540),
                        width: 0.50,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF528540),
                        width: 0.50,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 303,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Insira sua senha',
                    hintStyle: TextStyle(
                      color: Color(0xFF919191),
                      fontSize: 12,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.72,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF528540),
                        width: 0.50,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF528540),
                        width: 0.50,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 303,
                height: 44,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(width: 1, color: Color(0xFF528540)),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromRGBO(82, 133, 64, 1),
                    minimumSize: const Size(303, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: Color.fromRGBO(82, 133, 64, 1),
                        width: 1,
                      ),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SegundaRota()),
                    );
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Color.fromRGBO(82, 133, 64, 1),
                      fontFamily: 'Public Sans',
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.96,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cadastro()),
                  );
                },
                child: Container(
                  width: 303,
                  height: 44,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF528540),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0x444A4A4A)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Criar conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.96,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SegundaRota extends StatefulWidget {
  const SegundaRota({super.key});

  @override
  _SegundaRotaState createState() => _SegundaRotaState();
}

class _SegundaRotaState extends State<SegundaRota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('TelaLogin'),
        ),
      ),
    );
  }
}

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
