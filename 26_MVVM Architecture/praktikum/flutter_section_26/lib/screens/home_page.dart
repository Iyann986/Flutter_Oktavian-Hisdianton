import 'package:flutter/material.dart';
import 'package:flutter_section_26/screens/contact/contact_page.dart';
import 'package:flutter_section_26/screens/food/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MVVM'),
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            text: 'Contact',
          ),
          Tab(
            text: 'Food',
          )
        ]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [ContactPage(), FoodPage()]),
    );
  }
}
