class MealModel {
 List<String> mealNames;
 List<List<List<String>>> mealOptions;

MealModel({
    List<String>? mealNames,
    List<List<List<String>>>? mealOptions,
  })  : mealNames = mealNames ?? [],
        mealOptions = mealOptions ?? [];

}
