import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawan/features/presentation/player/club/create-club/create_club_state.dart';

class CreateClubLogic extends GetxController {
  CreateClubState state = CreateClubState();

  void image() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state.selectedImage.value = image.path;
    }
  }
}
