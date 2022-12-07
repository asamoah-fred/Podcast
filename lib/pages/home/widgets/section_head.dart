import 'package:flutter/material.dart';
import 'package:provider_demo/utils/custom_colors.dart';

class SectionHead extends StatelessWidget {
  const SectionHead({Key key, this.leftText, this.onpress}) : super(key: key);
  final String leftText;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftText,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onpress,
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 15,
                  color: customBlueColor,
                ),
          ),
        ),
      ],
    );
  }
}
