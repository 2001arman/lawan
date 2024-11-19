import 'package:get/get.dart';

class FeedbackLogic extends GetxController {
  var rating = (-1).obs;

  String selectedByStar(int index) {
    switch (index) {
      case 0:
        return 'Very Poor';
      case 1:
        return 'Poor';
      case 3:
        return 'Average';
      case 4:
        return 'Excellent';
      default:
        return 'Very Excellent';
    }
  }
}
