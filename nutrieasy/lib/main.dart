import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/initial-page.dart';
import './screens/login.dart';
import './screens/cadastro.dart';
import './screens/formsqtdref.dart';
import 'check-page.dart';
// import './screens/NomeRefsPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC147lSpHHq35q2t49K3hIhtKEYU79vLMg',
      appId: '1:296032970774:android:01dc84ee87b13e20136d37',
      messagingSenderId: 'zThr3hF3aJ4jQqIbbSVVEvwyoir-yQEaeylUNDp6_9k',
      databaseURL: 'https://dbnutrieasy-default-rtdb.firebaseio.com/',
      projectId: '296032970774',
    ),
  );
  FirebaseAuth.instance.signOut();
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
      initialRoute: 'Check',
      routes: {
        'TelaInicial': (context) => const InitialPage(),
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => SignUpPage(),
        'Check': (context) => const CheckPage(),
        // '/forms': (context) => FormsPage(),
        '/formsQtdRefeicoes': (context) => const FormsIIPage(),
        // '/formsCadastroAlimentos': (context) => CadastroAlimentosPage(),
        // '/cadarpio': (context) => CardapioPage(),
      },
    );
  }
}
