import 'package:flutter/material.dart';
import 'package:recipe_list/models/recipe.dart';
import 'package:recipe_list/models/recipe_api.dart';
import 'package:recipe_list/views/widgets/recipe_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Recipe> recipeList = [];
  bool _isLoading = true;

  Future getRecipes() async {
    recipeList = await RecipeApi.response();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.restaurant_menu,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Recetas de comida',
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              cacheExtent: 0.0,
              itemCount: recipeList.length,
              itemBuilder: (context, index) => (index != recipeList.length - 1)
                  ? RecipeCard(
                      recipeList[index],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RecipeCard(recipeList[index]),
                        const SizedBox(
                          height: 200,
                        )
                      ],
                    ),
            ),
    );
  }
}
