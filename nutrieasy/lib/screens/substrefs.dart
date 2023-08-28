import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nutrieasy/screens/cardapio.dart';

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
        padding: const EdgeInsets.all(45.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.white,
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
                  color: Color(0xFF528540),
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
                                  color: Color(0xFF4A4A4A),
                                  // fontWeight: FontWeight.bold,
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

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Cardapio()),
                );
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
                  'salvar',
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
      ),
    );
  }

  // void CreateMeals() {
  //   DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('cardapio');
  //   for (int i = 0; i < widget.mealNames.length; i++) {
  //     String nameMeal = textControllers[i].text;
  //     if(nameMeal.isNotEmpty){
  //       databaseReference.push().set({
  //         'name': nameMeal
  //       });
  //     }
  //   }
  // }
}
