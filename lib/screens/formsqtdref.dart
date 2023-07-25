import 'package:flutter/material.dart';
import 'package:nutrieasy/screens/homepage.dart';

class FormsIIPage extends StatefulWidget {
  const FormsIIPage({Key? key}) : super(key: key);

  @override
  //ignore: library_private_types_in_public_api
  _FormsIIPageState createState() => _FormsIIPageState();
}

class _FormsIIPageState extends State<FormsIIPage> {
  double _numberOfMeals = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 142,
            ),
            const SizedBox(
              width: 358,
              child: Text(
                'Vamos inserir seu plano alimentar?',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontSize: 16,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 38),
            const Text(
              'Você pode alterar suas preferências a qualquer momento.',
              style: TextStyle(
                color: Color(0xFF919191),
                fontSize: 12,
                fontFamily: 'Public Sans',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.72,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 341,
              child: Text(
                'Quantas refeições você faz por dia?',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 50,
                child: SliderTheme(
                  data: SliderThemeData(
                    thumbColor: const Color(0xFF528540),
                    activeTrackColor: const Color(0xFF528540),
                    inactiveTrackColor: Colors.white,
                    overlayColor: const Color(0xFF528540).withOpacity(0.3),
                    valueIndicatorColor: Colors.white,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Color(0xFF528540),
                      fontSize: 12,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.72,
                    ),
                  ),
                  child: Slider(
                    value: _numberOfMeals,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: _numberOfMeals.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _numberOfMeals = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 77,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF528540),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side:
                        const BorderSide(width: 0.50, color: Color(0x444A4A4A)),
                  ),
                  elevation: 4,
                  minimumSize: const Size(303, 44),
                ),
                child: const Text(
                  'Avançar',
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
          ],
        ),
      ),
    );
  }
}
