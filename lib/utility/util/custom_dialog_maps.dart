// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/util/glass_effect_dialog_container.dart';

class CustomDialogMaps {
  static void chooseDialogLocation({required Function(String) onSelected}) {
    final names = [
      'Kuala Lumpur',
      'Selangor',
      'Petaling Jaya',
    ];
    Get.bottomSheet(
      GlassEffectDialogContainer(
        height: 0.75,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Choose Location',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const Spacer(),
                  CircleButtonTransparentWidget(
                    onTap: Get.back,
                    size: 40,
                    widget: SvgPicture.asset('assets/icons/x.svg'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14.4746,
                  ),
                  myLocationEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (GoogleMapController controller) {},
                  onTap: (data) async {
                    Get.log('cek data $data');
                    final address = await placemarkFromCoordinates(
                        data.latitude, data.longitude);
                    Get.log('cek address $address');
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(defaultMargin),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/target.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Petaling Jaya',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              Text(
                                'Selangor',
                                style: darkGreyTextStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/x-circle.svg',
                          color: kDarkgreyColor,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultMargin),
                    child: CustomTextFormField(
                      margin: 0,
                      hintText: '',
                      controller: TextEditingController(),
                      prefix: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/search.svg'),
                      ),
                      showClear: true,
                    ),
                  ),
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8, left: 14),
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: kWhiteColor.withOpacity(0.2),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  names[i],
                                  style: blackTextStyle.copyWith(
                                      fontWeight: medium),
                                ),
                                Text(
                                  'Selangor',
                                  style:
                                      darkGreyTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  CustomButton(
                    title: 'Cancel',
                    isBlack: false,
                    onTap: () => Get.back(),
                  ),
                  const SizedBox(width: 16),
                  CustomButton(
                    title: 'Save',
                    isBlack: true,
                    onTap: () {
                      Get.back();
                      onSelected('Petaling Jaya');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
    );
  }
}
