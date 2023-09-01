import 'dart:convert';

class NutritionistModel {
  final int id;
  final String name;
  final String photo;
  final String title;
  final double rating;
  final String bio;
  final String experience;

  NutritionistModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.title,
    required this.rating,
    required this.bio,
    required this.experience,
  });

  factory NutritionistModel.fromJson(Map<String, dynamic> json) {
    return NutritionistModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      title: json['title'],
      rating: json['rating'],
      bio: json['bio'],
      experience: json['experience'],
    );
  }

  factory NutritionistModel.fromString(String source) {
    return NutritionistModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photo': photo,
        'title': title,
        'rating': rating,
        'bio': bio,
        'experience': experience,
      };
}
