class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        name: json['name'] ?? '',
        images: (json['images']?[0]
                as Map<String, dynamic>)['hostedLargeUrl'] ??
            'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
        rating: json['rating'] ?? 0 as double,
        totalTime: json['totalTime'] ?? '30 min',
      );

  static List<Recipe> recipeFromSnapshot(List snapshot) => snapshot
      .map(
        (data) => Recipe.fromJson(data),
      )
      .toList();

  @override
  String toString() {
    return 'Name: $name\nImages: $images\nRating: $rating\nTime: $totalTime\n';
  }
}
