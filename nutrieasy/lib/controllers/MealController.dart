import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nutrieasy/models/RefeicaoOptionModel.dart';

class MealController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();

  Future<String> createMenuWithMeals(List<String> mealNames) async {
    try {
      final User? user = _auth.currentUser;

      if (user == null) {
        throw Exception('Usuário não autenticado');
      }

      final String userId = user.uid;

      final DatabaseEvent event =
          await _databaseReference.child('cardapios').child(userId).once();

      final DataSnapshot dataSnapshot = event.snapshot;

      if (dataSnapshot.value != null) {
        throw Exception('Você já possui um cardápio');
      }

      DatabaseReference menuRef =
          _databaseReference.child('cardapios').child(userId);

      await menuRef.set({'user_id': userId});

      for (int i = 0; i < mealNames.length; i++) {
        await menuRef.child('refeicoes').child('refeicao_$i').set({
          'nome': mealNames[i],
        });
      }

      return (userId);
    } catch (e) {
      print('Erro ao criar cardápio: $e');
      return ("false");
    }
  }

  Future<String> findMealByUserIdAndName(String userId, String mealName) async {
    try {
      DatabaseReference menuRef = _databaseReference
          .child('cardapios')
          .child(userId)
          .child('refeicoes');

      DatabaseEvent event = await menuRef.once();
      DataSnapshot dataSnapshot = event.snapshot;
      Map<dynamic, dynamic> data = (dataSnapshot.value) as dynamic;

      Map meals = data;

      for (var entry in meals.entries) {
        String mealId = entry.key;
        var mealData = entry.value;

        String name = mealData['nome'];

        if (mealData['nome'] == mealName) {
          return mealId;
        }
      }
      return "";
    } catch (e) {
      print('Erro ao encontrar refeição: $e');
      return "";
    }
  }

  Future<bool> addOptionsToMeal(
      String userId, String mealId, List<List<String>> options) async {
    try {
      DatabaseReference mealRef = _databaseReference
          .child('cardapios')
          .child(userId)
          .child('refeicoes')
          .child(mealId)
          .child('opcoes');

      for (int i = 0; i < options.length; i++) {
        await mealRef.child('opcao_$i').set(options[i]);
      }
      return true;
    } catch (e) {
      print('Erro ao adicionar opções à refeição: $e');
      return false;
    }
  }

  Future<List<String>> getRefeicoesList(String userId) async {
    final DatabaseEvent mealRef = await _databaseReference
        .child('cardapios')
        .child(userId)
        .child('refeicoes')
        .once();

    try {
      DataSnapshot snapshot = mealRef.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic>? values =
            snapshot.value as Map<dynamic, dynamic>?;
        List<String> refeicoesList = [];

        Map? meals = values;

        for (var entry in meals!.entries) {
          String mealId = entry.key;
          var mealData = entry.value;

          String name = mealData['nome'];

          refeicoesList.add(name);
        }

        List<String> mealsName = refeicoesList;

        return mealsName;
      } else {
        return []; 
      }
    } catch (error) {
      print("Erro ao buscar dados: $error");
      return []; 
    }
  }

Future<List<RefeicaoOptionModel>> findMealOptions(String userId, String mealName, bool update) async {
  try {
    String mealId = await findMealByUserIdAndName(userId, mealName);

    if (mealId.isEmpty) {
      return [];
    }

    DatabaseReference mealRef = _databaseReference
        .child('cardapios')
        .child(userId)
        .child('refeicoes')
        .child(mealId)
        .child('opcoes');

    DatabaseEvent event = await mealRef.once();
    DataSnapshot dataSnapshot = event.snapshot;
    Map<dynamic, dynamic> data = dataSnapshot.value as Map<dynamic, dynamic>;

    List<RefeicaoOptionModel> mealOptions = [];

    if (data != null) {
      Map options = data;

      if (update){
        Random random = Random();
        for (var entry in options.entries) {
          for (int x = 0; x < entry.value.length; x++) {
            String optionName = entry.value[x];
            String optionId = "generate_your_id_here"; 
            if (random.nextInt(options.length) == 0) {
              mealOptions.add(RefeicaoOptionModel(name: optionName));
            }
          }
        }
      } else {
        for (var entry in options.entries) {
          for (int x = 0; x < entry.value.length; x++) {
            String optionName = entry.value[x];
            String optionId = "generate_your_id_here"; 
            mealOptions.add(RefeicaoOptionModel(name: optionName));
          }
        }
      }
    }

    return mealOptions;
  } catch (e) {
    print('Erro ao encontrar opções de refeição: $e');
    return [];
  }
}

}