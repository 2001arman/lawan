import '../../domain/field/field_model.dart';

class FieldDataSource {
  List<FieldModel> listFieldModel = [
    FieldModel(
      id: 1,
      icon: 'assets/fields/badminton.png',
      name: 'Badminton',
      totalGame: 234,
      options: [
        OptionModel(name: 'Single', totalGame: 124),
        OptionModel(name: 'Double', totalGame: 124),
      ],
    ),
    FieldModel(
      id: 2,
      icon: 'assets/fields/basketball.png',
      name: 'Basketball',
      totalGame: 54,
    ),
    FieldModel(
      id: 3,
      icon: 'assets/fields/ball.png',
      name: 'Futsal',
      totalGame: 240,
    ),
    FieldModel(
      id: 4,
      icon: 'assets/fields/golf.png',
      name: 'Golf',
      totalGame: 234,
      options: [
        OptionModel(name: 'Single', totalGame: 124),
        OptionModel(name: 'Team', totalGame: 124),
      ],
    ),
    FieldModel(
      id: 5,
      icon: 'assets/fields/martial.png',
      name: 'Martial Combat',
      totalGame: 64,
    ),
    FieldModel(
      id: 6,
      icon: 'assets/fields/pickleball.png',
      name: 'Pickleball',
      totalGame: 456,
      options: [
        OptionModel(name: 'Single', totalGame: 124),
        OptionModel(name: 'Double', totalGame: 124),
      ],
    ),
    FieldModel(
      id: 7,
      icon: 'assets/fields/rugby.png',
      name: 'Rugby',
      totalGame: 234,
      options: [
        OptionModel(name: 'Sevens', totalGame: 124),
        OptionModel(name: 'Union', totalGame: 124),
      ],
    ),
    FieldModel(
      id: 8,
      icon: 'assets/fields/ball.png',
      name: 'Soccer',
      totalGame: 234,
    ),
    FieldModel(
      id: 9,
      icon: 'assets/fields/takraw.png',
      name: 'Takraw',
      totalGame: 234,
    ),
    FieldModel(
      id: 10,
      icon: 'assets/fields/tennis.png',
      name: 'Tennis',
      totalGame: 234,
      options: [
        OptionModel(name: 'Single', totalGame: 124),
        OptionModel(name: 'Double', totalGame: 124),
      ],
    ),
    FieldModel(
      id: 11,
      icon: 'assets/fields/volley.png',
      name: 'Volleyball',
      totalGame: 234,
    ),
  ];
}
