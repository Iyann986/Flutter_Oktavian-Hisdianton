import 'package:flutter/cupertino.dart';

import '../../data/api_client.dart';
import '../../models/food.dart';

class FoodViewModel extends ChangeNotifier {
  FoodViewState _state = FoodViewState.loading;
  FoodViewState get state => _state;

  List<Food> _listFoods = [];
  List<Food> get listFood => _listFoods;

  _changeState(FoodViewState state) {
    _state = state;
    notifyListeners();
  }

  getAllFoods() async {
    try {
      final results = await ApiClient.getData();
      _listFoods = results.foods;
      notifyListeners();
      _changeState(FoodViewState.none);
    } catch (e) {
      _changeState(FoodViewState.error);
    }
  }
}

enum FoodViewState { none, loading, error }
