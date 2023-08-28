import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrieasy/check-page.dart';
import 'package:nutrieasy/screens/formsqtdref.dart';
import 'package:nutrieasy/screens/login.dart';
// import 'package:nutrieasy/screens/initial-page.dart';

class SignUpPage extends StatefulWidget {

  // const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firebaseAuth = FirebaseAuth.instance;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthdateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

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
                child: 
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        hintText: 'Insira seu nome completo',
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
                child: TextFormField(
                  controller: _birthdateController,
                  onTap: () => _selectDate(context),
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
                  ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 303,
                child: TextFormField(
                  controller: _emailController,
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
                  controller: _passwordController,
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
                    Register();
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
      bottomNavigationBar: Container(
        width: 60,
        height: 135,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/footer.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  Register() async {
    try{
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: _emailController.text, 
            password: _passwordController.text
            );
        if (userCredential != null) {
          userCredential.user!.updateDisplayName(_nameController.text);
          Navigator.pushAndRemoveUntil(
            context as BuildContext, 
            MaterialPageRoute(builder: (context) => FormsIIPage(),
            ),
            (route) => false);
        }
    }on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mais forte.'),
            backgroundColor: Colors.redAccent,
            ),
        );
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Este e-mail já foi cadastrado.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}


