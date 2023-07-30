import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './screens/login.dart';
import './screens/cadastro.dart';
import './screens/formsqtdref.dart';
// import './screens/NomeRefsPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NutriEasy",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
        fontFamily: 'Public Sans',
      ),
      initialRoute: 'TelaInicial',
      routes: {
        'TelaInicial': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const SignUpPage(),
        // '/forms': (context) => FormsPage(),
        // '/formsQtdRefeicoes': (context) => FormsIIPage(),
        // '/formsCadastroAlimentos': (context) => CadastroAlimentosPage(),
        // '/cadarpio': (context) => CardapioPage(),
      },
    );
  }
}
