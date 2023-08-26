import 'package:flutter/material.dart';
// import 'package:nutrieasy/screens/formsqtdref.dart';

class NomeRefsPage extends StatefulWidget {
  final int numberOfMeals;

  const NomeRefsPage({required this.numberOfMeals, Key? key}) : super(key: key);

  @override
  _NomeRefsPageState createState() => _NomeRefsPageState();
}

class _NomeRefsPageState extends State<NomeRefsPage> {
  late List<String> textFieldValues;

  @override
  void initState() {
    super.initState();
    textFieldValues = List.generate(widget.numberOfMeals, (index) => '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Vamos inserir seu plano alimentar?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Você pode alterar suas preferências a qualquer momento.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Public Sans',
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Preencha com o nome de cada refeição presente no seu plano:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Public Sans',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: textFieldValues.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          textFieldValues[index] = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Refeição ${index + 1}',
                        labelStyle: const TextStyle(
                            color: Colors.green), // Cor do rótulo
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0), // Borda ao ganhar foco
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.green,
                              width: 1.0), // Borda quando desabilitado
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.green, width: 1.0), // Borda padrão
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NextScreen(textFieldValues: textFieldValues),
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
        bottomNavigationBar: Container(
            width: 60,
            height: 135,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/footer.png'),
              fit: BoxFit.cover,
            ))));
  }
}

class NextScreen extends StatelessWidget {
  final List<String> textFieldValues;

  const NextScreen({required this.textFieldValues, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Próxima Tela'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Valores dos TextFields:'),
            for (int i = 0; i < textFieldValues.length; i++)
              Text('Campo ${i + 1}: ${textFieldValues[i]}'),
          ],
        ),
      ),
    );
  }
}
