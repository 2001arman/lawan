import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

class CustomImageWidget extends StatelessWidget {
  final String path;
  final VoidCallback changeImage;
  final VoidCallback deleteImage;
  final PictureType pictureType;
  const CustomImageWidget(
      {super.key,
      required this.path,
      required this.changeImage,
      required this.deleteImage,
      required this.pictureType});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.88 / 1,
      child: Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          bottom: defaultMargin,
          right: 8,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: pictureType == PictureType.file
                ? FileImage(
                    File(path),
                  )
                : AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: changeImage,
              child: SvgPicture.asset(
                'assets/icons/container_rotate.svg',
                width: 36,
                height: 36,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: deleteImage,
              child: SvgPicture.asset(
                'assets/icons/container_trash.svg',
                width: 36,
                height: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
