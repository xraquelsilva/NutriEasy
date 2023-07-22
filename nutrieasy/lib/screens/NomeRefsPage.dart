import 'package:flutter/material.dart';

class NomeRefsPage extends StatefulWidget {
  const NomeRefsPage({super.key});

  @override
  _NomeRefsPageState createState() => _NomeRefsPageState();
}

class _NomeRefsPageState extends State<NomeRefsPage> {
  List<String> textFieldValues = List.generate(6, (index) => '');

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
                      border: OutlineInputBorder(
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
                // Navega para a próxima tela passando os valores dos TextFields como argumento.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NextScreen(textFieldValues: textFieldValues),
                  ),
                );
              },
              child: const Text('Avançar'),
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final List<String> textFieldValues;

  const NextScreen({super.key, required this.textFieldValues});

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
