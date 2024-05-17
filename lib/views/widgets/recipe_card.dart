import 'package:flutter/material.dart';
import 'package:recipe_list/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard(
    this.recipe, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Transform.scale(
          scale: 0.4 + (0.6 * value),
          child: Transform.translate(
              offset: Offset(-200 * (1 - value as double), 0.0),
              child: WidgetCard(recipe: recipe)),
        );
      },
    );
  }
}

class WidgetCard extends StatelessWidget {
  const WidgetCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: decoration(recipe.images),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 19,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(width: 7),
                      Text('${recipe.rating}'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(width: 7),
                      Text(recipe.totalTime),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration decoration(String images) {
  return BoxDecoration(
    color: Colors.black.withOpacity(0.2),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.6),
        offset: const Offset(
          0.0,
          10.0,
        ),
        blurRadius: 10.0,
        spreadRadius: -6.0,
      ),
    ],
    image: DecorationImage(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.35),
        BlendMode.multiply,
      ),
      image: NetworkImage(images),
      fit: BoxFit.cover,
    ),
  );
}
