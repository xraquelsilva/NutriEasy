import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrieasy/screens/substrefs.dart';
import '../controllers/MealController.dart';

class FoodEntryPage extends StatefulWidget {
  final List<String> mealNames;

  const FoodEntryPage({Key? key, required this.mealNames, required String userId}) : super(key: key);

  @override
  _FoodEntryPageState createState() => _FoodEntryPageState();
  
}

class _FoodEntryPageState extends State<FoodEntryPage> {
  int currentMealIndex = 0;
  List<List<List<String>>> mealOptions = [];
  late MealController _controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    mealOptions = List.generate(widget.mealNames.length, (_) => [[]]);
    _controller = MealController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(45.0),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int optionIndex = 0;
                        optionIndex < mealOptions[currentMealIndex].length;
                        optionIndex++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Opção ${optionIndex + 1}',
                            style: const TextStyle(
                              fontFamily: 'Public Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: mealOptions[currentMealIndex]
                                    [optionIndex]
                                .length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(mealOptions[currentMealIndex]
                                    [optionIndex][index]),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      mealOptions[currentMealIndex][optionIndex]
                                          .removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Color(0xFFF03D3D),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              _showAddFoodDialog(currentMealIndex, optionIndex);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color.fromRGBO(82, 133, 64, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    width: 0.50, color: Color(0x444A4A4A)),
                              ),
                              elevation: 4,
                              minimumSize: const Size(303, 44),
                            ),
                            child: const Text(
                              'Adicionar Alimento',
                              style: TextStyle(
                                color: Color.fromRGBO(82, 133, 64, 1),
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.96,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addOption(currentMealIndex);
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
                'Adicionar Opção',
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
              onPressed: () async {
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
  void _showAddFoodDialog(int mealIndex, int optionIndex) {
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
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF528540),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 0.50, color: Color(0x444A4A4A)),
                ),
              ),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  mealOptions[mealIndex][optionIndex].add(foodName);
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF528540),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 0.50, color: Color(0x444A4A4A)),
                ),
              ),
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  // Função para adicionar uma nova opção
  void _addOption(int mealIndex) {
    setState(() {
      mealOptions[mealIndex].add([]);
    });
  }

  // Função para alternar para a próxima refeição
  Future<void> _nextMeal() async {

    if (currentMealIndex < widget.mealNames.length - 1) {
      setState(() {
        currentMealIndex++;
      });
    } else {
      final user = _auth.currentUser;
      List<List<List<String>>> mealFoods = [];
      for (int i = 0; i < mealOptions.length; i++) {
        List<List<String>> optionFoods = [];
        for (int j = 0; j < mealOptions[i].length; j++) {
          optionFoods.add(mealOptions[i][j]);
        }
        var mealId = _controller.findMealByUserIdAndName(user!.uid, widget.mealNames[i]) ;
        String mealIdString = await mealId;
        await _controller.addOptionsToMeal(user.uid, mealIdString , optionFoods);
        mealFoods.add(optionFoods);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SubstRef(
            mealNames: widget.mealNames,
            mealFoods: mealFoods,
          ),
        ),
      );
    }
  }
}
