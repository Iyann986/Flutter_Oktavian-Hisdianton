import 'package:flutter/material.dart';
import 'package:flutter_section_27/data/api_client.dart';
import 'package:flutter_section_27/models/food_model.dart';

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.loading;
  FoodViewState get state => _state;

  List<Food> _foods = [];
  List<Food> get foods => _foods;

  _changeState(FoodViewState state) {
    _state = state;
    notifyListeners();
  }

  getAllFoods() async {
    try {
      final results = await FoodAPI.getFoods();
      _foods = results;
      notifyListeners();
      _changeState(FoodViewState.none);
    } catch (e) {
      _changeState(FoodViewState.error);
    }
  }
}

enum FoodViewState { none, loading, error }
