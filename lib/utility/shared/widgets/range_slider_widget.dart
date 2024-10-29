import 'package:flutter/material.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';

// ignore: must_be_immutable
class RangeSliderWidget extends StatefulWidget {
  RangeSliderWidget({
    super.key,
    required this.title,
    required this.dataText,
    required this.rangeValues,
    this.maxRange = 100,
    this.minRange = 1,
  });
  final String title;
  final String dataText;
  RangeValues rangeValues;
  final double maxRange, minRange;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${widget.rangeValues.start.toStringAsFixed(0)}${widget.dataText}',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
            Text(widget.title, style: darkGreyTextStyle),
            Expanded(
              child: Text(
                '${widget.rangeValues.end.toStringAsFixed(0)}${widget.dataText}',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 10,
          child: RangeSlider(
            values: widget.rangeValues,
            min: widget.minRange,
            max: widget.maxRange,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            onChanged: (RangeValues values) {
              setState(() {
                widget.rangeValues = values;
              });
            },
          ),
        ),
      ],
    );
  }
}
