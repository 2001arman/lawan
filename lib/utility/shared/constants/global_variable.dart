import 'package:get/get.dart';
import 'package:lawan/features/domain/field/field_model.dart';
import 'package:lawan/features/infrastructure/field/field_data_source.dart';

class GlobalVariable {
  Rxn<FieldModel> selectedSport = Rxn();

  Future<GlobalVariable> init() async {
    selectedSport.value = FieldDataSource().listFieldModel[7];
    return this;
  }

  void setSport(FieldModel field) {
    selectedSport.value = field;
    selectedSport.refresh();
  }
}
