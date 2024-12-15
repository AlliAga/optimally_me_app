import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/nutrition/screens/meal_plan_screen.dart';
import 'package:optimally_me_app/features/nutrition/screens/plan_overview_screen.dart';
import 'package:optimally_me_app/features/nutrition/screens/recipes_plan_screen.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: TabBar(
        controller: _tabController,
        indicatorWeight: 12,
        labelPadding: const EdgeInsets.only(top: 10, bottom: 3),
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
        tabs: const [
          Text("Meal Plan"),
          Text("Recipies"),
          Text("Plan overview"),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(122, 235, 235, 235),
        child: TabBarView(
          controller: _tabController,
          children: const [
            MealPlanScreen(),
            RecipesScreen(),
            PlanOverviewScreen(),
          ],
        ),
      ),
    );
  }
}
