import 'package:flutter/material.dart';

class FoodEntryPage extends StatefulWidget {
  final List<String> mealNames;

  const FoodEntryPage({Key? key, required this.mealNames}) : super(key: key);

  @override
  _FoodEntryPageState createState() => _FoodEntryPageState();
}

class _FoodEntryPageState extends State<FoodEntryPage> {
  int currentMealIndex = 0;
  List<List<String>> mealFoods = [];

  @override
  void initState() {
    super.initState();
    mealFoods = List.generate(widget.mealNames.length, (_) => []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Refeição: ${widget.mealNames[currentMealIndex]}',
              style: const TextStyle(
                fontFamily: 'Public Sans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mealFoods[currentMealIndex].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mealFoods[currentMealIndex][index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showAddFoodDialog();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF528540),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 0.50, color: Color(0x444A4A4A)),
                ),
                elevation: 4,
                minimumSize: const Size(303, 44),
              ),
              child: const Text(
                'Adicionar Alimento',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.96,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _nextMeal();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF528540),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 0.50, color: Color(0x444A4A4A)),
                ),
                elevation: 4,
                minimumSize: const Size(303, 44),
              ),
              child: const Text(
                'Próxima Refeição',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.96,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para mostrar o diálogo de adicionar alimento
  void _showAddFoodDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String foodName = '';
        return AlertDialog(
          title: const Text('Adicionar Alimento'),
          content: TextField(
            onChanged: (value) {
              foodName = value;
            },
            decoration: const InputDecoration(labelText: 'Nome do Alimento'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  mealFoods[currentMealIndex].add(foodName);
                });
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  // Função para alternar para a próxima refeição
  void _nextMeal() {
    if (currentMealIndex < widget.mealNames.length - 1) {
      setState(() {
        currentMealIndex++;
      });
    } else {
      // Se já passou por todas as refeições, redirecionar para uma tela de conclusão
      // ou tomar alguma ação apropriada.
    }
  }
}
