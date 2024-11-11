class FieldModel {
  final int id;
  final String icon;
  final String name;
  final int totalGame;
  final List<OptionModel>? options;

  FieldModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.totalGame,
    this.options,
  });

  // Factory method to create a FieldModel instance from JSON
  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      icon: json['icon'] as String,
      name: json['name'] as String,
      totalGame: json['total_game'] as int,
      options: json['options'] != null
          ? (json['options'] as List)
              .map((item) => OptionModel.fromJson(item))
              .toList()
          : null,
    );
  }

  // Method to convert a FieldModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'name': name,
      'total_game': totalGame,
      'options': options?.map((option) => option.toJson()).toList(),
    };
  }
}

class OptionModel {
  final String name;
  final int totalGame;

  OptionModel({
    required this.name,
    required this.totalGame,
  });

  // Factory method to create an OptionModel instance from JSON
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      name: json['name'] as String,
      totalGame: json['total_game'] as int,
    );
  }

  // Method to convert an OptionModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'total_game': totalGame,
    };
  }
}
