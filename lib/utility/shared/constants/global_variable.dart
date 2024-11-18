import 'package:get/get.dart';
import 'package:lawan/features/domain/field/field_model.dart';
import 'package:lawan/features/infrastructure/field/field_data_source.dart';

class GlobalVariable {
  Rxn<FieldModel> selectedSport = Rxn();
  RxBool isLogin = false.obs;
  RxBool isSingle = true.obs;

  Future<GlobalVariable> init() async {
    selectedSport.value = FieldDataSource().listFieldModel[7];
    return this;
  }

  void setSport(FieldModel field, bool sigle) {
    selectedSport.value = field;
    isSingle.value = sigle;
    selectedSport.refresh();
  }
}
