import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthRecoveryState {
  var stepIndex = 0.obs;

  List<String> listIcons = [
    'assets/icons/face-id.svg',
    'assets/icons/fingerprint.svg',
    'assets/icons/device-mobile.svg',
    'assets/icons/map-pin.svg',
    'assets/icons/bell.svg',
    'assets/icons/add-profile.svg',
  ];

  List<String> listTitle = [
    'Faster and secure login\nwith Face ID',
    'Instant and secure login\nwith Fingerprint',
    'Trust this device',
    'Enable location',
    'Keep up with your journey',
    'Add Profile Picture',
  ];

  List<String> listDescription = [
    'You can instantly and securely log in to\nyour account using biometirc data',
    'You can instantly and securely log in to\nyour account using biometirc data',
    'We won’t ask to verify your identity again if you trust this device. Only select “Always trust” if this device is not shared',
    'You’ll need to enable your location in order to use Lawan',
    'Turn on notifications to track your activity, plus find our about new features and rewards',
    'Add a profile picture to personalize your account',
  ];

  List<String> textButton = [
    'Continue',
    'Enable',
    'Enable',
    'Always Trust',
    'Allow Location',
    'Turn On Notifications',
    'Upload',
  ];

  List<String> textSkip = [
    'Skip',
    'Skip',
    'Skip',
    'Trust Once',
    'Allow Once',
    'Maybe Later',
    'Skip',
  ];

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Rxn<XFile> selectedImage = Rxn();
}
