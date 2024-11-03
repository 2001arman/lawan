import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/infrastructure/arena/arena_data_source.dart';

import '../../constants/constants_ui.dart';
import '../buttons/filter_button.dart';
import '../custom_text_form_fields.dart';
import '../navigations/tab_bar_widget.dart';
import 'select_field_image_widget.dart';

class ChooseArenaSectionModal extends StatefulWidget {
  const ChooseArenaSectionModal({
    super.key,
    required this.onSelectedArena,
    required this.selectedArena,
    required this.selectedCourt,
  });

  final RxInt selectedArena;
  final RxInt selectedCourt;
  final Function(int selectedArenaIndex, int selectedCourtIndex)
      onSelectedArena;

  @override
  State<ChooseArenaSectionModal> createState() =>
      _ChooseArenaSectionModalState();
}

class _ChooseArenaSectionModalState extends State<ChooseArenaSectionModal> {
  TextEditingController nameController = TextEditingController();
  var activeAlignment = Alignment.centerLeft.obs;
  var tabActive = 'Indoor'.obs;
  List<String> tabBarTitle = [
    'Indoor',
    'Outdoor',
  ];
  var selectedArenaIndex = (-1).obs;
  var selectedCourtIndex = 0.obs;

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Indoor':
        activeAlignment.value = Alignment.centerLeft;
        break;
      default:
        activeAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }

  @override
  void initState() {
    selectedArenaIndex = widget.selectedArena;
    selectedCourtIndex = widget.selectedCourt;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          SizedBox(height: defaultMargin),
          Text(
            'Choose arena',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            'Set where it should take place',
            style: darkGreyTextStyle.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 8),
          TabbarWidget(
            tabBarTitle: tabBarTitle,
            tabActive: tabActive,
            onTap: (title) {
              tabActive.value = title;
              alignmentTabbar(title);
            },
            alignment: activeAlignment,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CustomTextFormField(
                  margin: 0,
                  hintText: '',
                  controller: nameController,
                  onChanged: (data) {},
                  borderColor: kGreyColor,
                  prefix: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/search.svg'),
                  ),
                  showClear: true,
                ),
              ),
              SizedBox(width: defaultMargin),
              FilterButton(
                iconColor: kDarkgreyColor,
                textColor: kBlackColor,
              ),
            ],
          ),
          SizedBox(height: defaultMargin),
          Obx(
            () => Column(
              children: ArenaDataSource()
                  .listArena
                  .asMap()
                  .entries
                  .map(
                    (data) => GestureDetector(
                      onTap: () {
                        selectedArenaIndex.value = data.key;
                        selectedCourtIndex.value = 0;
                        widget.onSelectedArena(data.key, 0);
                      },
                      child: SelectFieldImageWidget(
                        arenaModel: data.value,
                        isSelected: data.key == selectedArenaIndex.value,
                        onChangeCourt: (courtIndex) {
                          selectedCourtIndex.value = courtIndex;
                          widget.onSelectedArena(data.key, courtIndex);
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
