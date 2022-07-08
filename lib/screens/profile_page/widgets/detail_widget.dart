import 'package:flutter/material.dart';
import 'package:puja_path/utils/values_manager.dart';

class DetailWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  DetailWidget({this.icon = Icons.phone, this.text = "number"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSize.s14,
        ),
        SizedBox(
          width: AppSize.s8,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
