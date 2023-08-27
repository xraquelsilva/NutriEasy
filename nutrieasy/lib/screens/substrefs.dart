import 'package:flutter/material.dart';

class SubstRef extends StatefulWidget {
  final List<String> mealNames;
  final List<List<List<String>>> mealFoods;

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
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedMealName = widget.mealNames[selectedMealIndex];
    final selectedOptionFoods =
        widget.mealFoods[selectedMealIndex][selectedOptionIndex];

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
            children: [
              DropdownButton<int>(
                value: selectedMealIndex,
                onChanged: (newValue) {
                  setState(() {
                    selectedMealIndex = newValue!;
                    selectedOptionIndex = 0; // Reset option index
                  });
                },
                items: List.generate(widget.mealNames.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(widget.mealNames[index]),
                  );
                }),
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
              DropdownButton<int>(
                value: selectedOptionIndex,
                onChanged: (newValue) {
                  setState(() {
                    selectedOptionIndex = newValue!;
                  });
                },
                items: List.generate(
                  widget.mealFoods[selectedMealIndex].length,
                  (index) {
                    return DropdownMenuItem<int>(
                      value: index,
                      child: Text('Opção ${index + 1}'),
                    );
                  },
                ),
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
                '$selectedMealName - Opção ${selectedOptionIndex + 1} com ${selectedOptionFoods.length} alimento(s)',
                style: const TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: selectedOptionFoods.map((food) {
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
