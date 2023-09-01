import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_food_item_model.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_model.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';

var foodDiaryMealPlansData = <FoodDiaryMealPlanModel>[
  FoodDiaryMealPlanModel(
    uuid: 'waefrg6543',
    mealTimeOfDay: DateTime.now(),
    name: 'Breakfast',
    description: 'Recommended',
    mealPlanItems: [
      FoodDiaryMealPlanItemModel(
        id: 0,
        description: 'Remember to wash the apples before you eat them',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Main',
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Yoghurt', id: 0),
          ),
        ],
        img: '',
        name: 'Yoghurt',
      ),
      FoodDiaryMealPlanItemModel(
        id: 0,
        description: '',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Main',
        labelColor: Colors.deepPurple,
        alertColor: Colors.green,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Banana', id: 0),
          ),
        ],
        name: 'Bananas',
        img: '',
      ),
      FoodDiaryMealPlanItemModel(
        id: 0,
        description: '',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Main',
        labelColor: Colors.yellow.shade900,
        alertColor: Colors.red,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Chewing Gum', id: 0),
          ),
        ],
        name: 'Chewing Gum',
        img: '',
      ),
      FoodDiaryMealPlanItemModel(
        id: 0,
        description: '',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Main',
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'glass',
            foodItem: FoodDetailsModel(name: 'Banana', id: 0),
          ),
        ],
        name: 'Water',
        img: '',
      ),
    ],
    alertColor: Colors.green,
  ),
  FoodDiaryMealPlanModel(
    uuid: 'waefrg6543',
    mealTimeOfDay: DateTime.now(),
    name: 'Lunch',
    description: 'Recommended',
    mealPlanItems: [
      FoodDiaryMealPlanItemModel(
        id: 0,
        name: 'Githeri',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Main',
        labelColor: Colors.brown.shade900,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Beans', id: 0),
          ),
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Maize', id: 0),
          ),
        ],
        description: '',
        img: '',
      ),
      FoodDiaryMealPlanItemModel(
        id: 0,
        name: 'Avocado',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Fruit',
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Avocado', id: 0),
          ),
        ],
        description: '',
        img: '',
      ),
      FoodDiaryMealPlanItemModel(
        id: 0,
        name: 'Orange juice',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Liquid',
        labelColor: Colors.orange.shade600,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Orange juice', id: 0),
          ),
        ],
        description: '',
        img: '',
      ),
    ],
    alertColor: Colors.green,
  ),
  FoodDiaryMealPlanModel(
    uuid: 'waefrg6543',
    mealTimeOfDay: DateTime.now(),
    name: 'Snack',
    description: 'Recommended',
    mealPlanItems: [
      FoodDiaryMealPlanItemModel(
        id: 0,
        name: 'Oreo',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Snack',
        labelColor: Colors.black,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Oreo', id: 0),
          ),
        ],
        description: '',
        img: '',
      ),
      FoodDiaryMealPlanItemModel(
        id: 0,
        name: 'Mango juice',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Snack',
        labelColor: Colors.orange.shade900,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Mango juice', id: 0),
          ),
        ],
        img: '',
        description: '',
      ),
    ],
    alertColor: Colors.green,
  ),
  FoodDiaryMealPlanModel(
    uuid: 'waefrg6543',
    mealTimeOfDay: DateTime.now(),
    name: 'Dinner',
    description: 'Recommended',
    mealPlanItems: [
      FoodDiaryMealPlanItemModel(
        id: 0,
        name: 'Beef Stew',
        quantity: 1,
        quantityMetric: 'item',
        label: 'Main',
        labelColor: themeColor,
        foodItems: [
          FoodDiaryMealPlanItemFoodItemModel(
            id: 0,
            quantity: 1,
            metric: 'kg',
            foodItem: FoodDetailsModel(name: 'Beef', id: 0),
          ),
        ],
        img: '',
        description: '',
      ),
    ],
    alertColor: Colors.green,
  ),
];
