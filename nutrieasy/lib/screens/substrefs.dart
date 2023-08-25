import 'package:flutter/material.dart';
import 'dart:math';

class SubstRef extends StatefulWidget {
  final List<String> mealNames;
  final List<List<String>> mealFoods;

  const SubstRef({
    required this.mealNames,
    required this.mealFoods,
    Key? key,
  }) : super(key: key);

  @override
  _SubstRefState createState() => _SubstRefState();
}

class _SubstRefState extends State<SubstRef> {
  int selectedMealIndex = 0;
  List<String> selectedFoods = [];

  @override
  void initState() {
    super.initState();
    selectedFoods = widget.mealFoods[selectedMealIndex];
  }

  List<String> generateRandomFoods(List<String> foods, int count) {
    List<String> selected = [];
    final random = Random();
    while (selected.length < count) {
      String food = foods[random.nextInt(foods.length)];
      if (!selected.contains(food)) {
        selected.add(food);
      }
    }
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    final selectedMealName = widget.mealNames[selectedMealIndex];
    final totalFoods = widget.mealFoods[selectedMealIndex].length;

    int displayCount;
    int substituteCount;

    if (totalFoods <= 2) {
      displayCount = totalFoods;
      substituteCount = 0;
    } else if (totalFoods % 2 == 0) {
      displayCount = totalFoods ~/ 2;
      substituteCount = displayCount;
    } else {
      displayCount = (totalFoods ~/ 2) + 1;
      substituteCount = totalFoods - displayCount;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFCDDE47),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedMealName,
                onChanged: (newValue) {
                  setState(() {
                    selectedMealIndex = widget.mealNames.indexOf(newValue!);
                    selectedFoods = widget.mealFoods[selectedMealIndex];
                  });
                },
                items: widget.mealNames
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                style: const TextStyle(
                  fontFamily: 'Public Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF4A4A4A),
                ),
                underline: Container(
                  height: 2,
                  color: const Color(0xFFDE7047),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '$selectedMealName com ${selectedFoods.length} alimento(s)',
                style: const TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: selectedFoods.sublist(0, displayCount).map((food) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            food,
                            style: const TextStyle(
                              fontFamily: 'PublicSans',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (substituteCount == 0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Alimentos Substitutos'),
                          content: const Text(
                            'Não há alimentos substitutos para essa refeição.',
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
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0x444A4A4A)),
                                ),
                              ),
                              child: const Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    final randomFoods = generateRandomFoods(
                        selectedFoods.sublist(displayCount), substituteCount);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Alimentos Substitutos'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: randomFoods.map((food) {
                              return Text(food);
                            }).toList(),
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
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0x444A4A4A)),
                                ),
                              ),
                              child: const Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF528540),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side:
                        const BorderSide(width: 0.50, color: Color(0x444A4A4A)),
                  ),
                  minimumSize: const Size(44, 44),
                ),
                child: const Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.bold,
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