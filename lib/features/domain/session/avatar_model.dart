import 'package:get/get.dart';

class AvatarModel {
  final String name;
  final String asset;
  final String position;
  RxBool isSelected;

  AvatarModel({
    required this.name,
    required this.asset,
    required this.position,
    required this.isSelected,
  });
}
