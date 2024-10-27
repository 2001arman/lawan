// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants_ui.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.title,
    this.isPassword = false,
    this.minLines = 1,
    required this.controller,
    this.onChanged,
    this.isReadOnly = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffix,
    this.margin = 12,
    this.borderColor,
    this.prefix,
    this.showSuffix = false,
    this.maxLength,
    this.onTap,
    this.showClear = false,
    this.inputFormatters,
    this.onClear,
    this.verticalPadding = 12,
    this.horizontalPadding = 16,
  });

  final String hintText;
  final String? title;
  final bool isPassword, isReadOnly;
  final int minLines;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? suffix, prefix;
  final double margin;
  final Color? borderColor;
  final bool showSuffix;
  final int? maxLength;
  final VoidCallback? onTap;
  final bool showClear;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onClear;
  final double verticalPadding, horizontalPadding;

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: darkGreyTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          if (widget.title != null) const SizedBox(height: 4),
          TextFormField(
            maxLength: widget.maxLength,
            controller: widget.controller,
            obscureText: widget.isPassword,
            readOnly: widget.isReadOnly,
            onTap: widget.onTap,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
              if (value == '') {
                showIcon = false;
              } else {
                showIcon = true;
              }
              setState(() {});
            },
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
            decoration: InputDecoration(
              counterText: "",
              prefixIcon: widget.prefix,
              suffixIconConstraints: widget.showClear
                  ? BoxConstraints.tight(
                      const Size(40, 20),
                    )
                  : null,
              suffixIcon: widget.showSuffix
                  ? widget.suffix
                  : widget.suffix != null || widget.showClear
                      ? GestureDetector(
                          onTap: () {
                            widget.controller.text = '';
                            showIcon = false;
                            setState(() {});
                            if (widget.onClear != null) {
                              widget.onClear!();
                            }
                          },
                          child: Visibility(
                            visible: showIcon,
                            child: widget.showClear
                                ? SvgPicture.asset(
                                    'assets/icons/x-circle.svg',
                                    color: kDarkgreyColor,
                                    width: 20,
                                    height: 20,
                                  )
                                : widget.suffix as Widget,
                          ),
                        )
                      : null,
              hintText: widget.hintText,
              hintStyle: midGreyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              isDense: false,
              contentPadding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
                horizontal: widget.horizontalPadding,
              ),
              filled: true,
              focusColor: kWhiteColor,
              fillColor: kWhiteColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
            ),
            maxLines: widget.minLines,
            keyboardType: widget.textInputType,
          ),
        ],
      ),
    );
  }
}
