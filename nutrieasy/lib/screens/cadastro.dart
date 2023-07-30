import 'package:flutter/material.dart';
import 'package:nutrieasy/screens/formsqtdref.dart';
import 'package:nutrieasy/screens/login.dart';
// import 'package:nutrieasy/screens/homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
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
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Insira seu nome',
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
                  controller: birthdateController,
                  decoration: const InputDecoration(
                    hintText: 'Insira sua data de nascimento',
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
                  onTap: () => _selectDate(context),
                  readOnly: true,
                ),
              ),
              const SizedBox(height: 16),
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
                    foregroundColor: const Color.fromRGBO(82, 133, 64, 1),
                    backgroundColor: Colors.white,
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
                        builder: (context) => const FormsIIPage(),
                        // builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Cadastrar-se',
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
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
                      'Voltar para Login',
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != birthdateController) {
      setState(() {
        birthdateController.text = picked.toString();
      });
    }
  }
}
