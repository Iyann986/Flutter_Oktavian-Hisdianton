import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_section_27/screen/food_viewmodel.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodViewModel>(context, listen: false).getAllFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<FoodViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter MVVM Food'),
      ),
      body: ListView.builder(
        itemCount: modelView.foods.length,
        itemBuilder: (context, index) {
          final food = modelView.foods[index];
          return ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(food.name),
          );
        },
      ),
    );
  }
}
