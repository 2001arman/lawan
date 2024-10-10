import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';

import '../../constants/constants_ui.dart';

class FieldImageWidget extends StatelessWidget {
  final ArenaModel arenaModel;
  final int selectedCourt;
  const FieldImageWidget(
      {super.key, required this.arenaModel, required this.selectedCourt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 1, color: kGreyColor),
        image: DecorationImage(
          image: arenaModel.courtData[selectedCourt].pictureType ==
                  PictureType.asset
              ? AssetImage(
                  arenaModel.courtData[selectedCourt].pictures.first.path,
                )
              : FileImage(
                  File(arenaModel.courtData[selectedCourt].pictures.first.path),
                ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
