import 'package:flutter/material.dart';
import 'package:flutter_section_26/item_data.dart';
import 'package:flutter_section_26/models/food.dart';
import 'package:flutter_section_26/screens/food/food_viewmodel.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodViewModel>(context, listen: false).getAllFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FoodViewModel>(context);
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Center(
            child: _body(viewModel),
          )),
    );
  }

  Widget _body(FoodViewModel viewModel) {
    final isLoading = viewModel.state == FoodViewState.loading;
    final isError = viewModel.state == FoodViewState.error;

    if (isLoading) {
      return const CircularProgressIndicator();
    } else if (isError) {
      return const Text(
        'Tidak ada Data',
        style: TextStyle(fontSize: 30, color: Colors.red),
      );
    } else {
      return _itemList(viewModel.listFood);
    }
  }

  Widget _itemList(List<Food> listFood) => listFood.isEmpty
      ? const Center(
          child: Text(
            'Tidak ada Data',
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
        )
      : ListView.builder(
          itemCount: listFood.length,
          itemBuilder: (context, index) {
            var food = listFood[index];
            return ItemData(
              title: food.name,
              subtitle: 'id number ${food.id}',
            );
          });
}
