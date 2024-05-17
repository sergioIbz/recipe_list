

import 'package:dio/dio.dart';
import 'package:recipe_list/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> response() async {
    Dio dio = Dio();

    const String url =
        'https://yummly2.p.rapidapi.com/feeds/list?limit=24&start=0';


    Map<String, dynamic> headers = {
      'x-rapidapi-key': 'a2d587142bmsh78d162be4d1e4b9p1988acjsn270e8c3ee7df',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'Content-Type': 'application/json',
    };

    BaseOptions options = BaseOptions(
      
      connectTimeout: const Duration(milliseconds: 5000), // 5 segundos
      receiveTimeout: const Duration(milliseconds: 10000), // 3 segundos
      headers: headers,
    );

    dio.options = options;

    final response = await dio.get(url);

    Map data = response.data;
    List temp = [];
    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipeFromSnapshot(temp);
  }
}
