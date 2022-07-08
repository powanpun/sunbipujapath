import 'package:flutter/material.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class ProfileActionWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  ProfileActionWidget({
    this.icon = Icons.add,
    this.text = "Add family members Horoscope",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSize.s16,
        ).addBorder(
          context,
          addBorder: false,
          padding: EdgeInsets.all(AppPadding.p10),
          color: ColorManager.grey2,
          borderRadius: AppSize.s10,
        ),
        SizedBox(
          width: 30,
        ),
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 16))
      ],
    ).addBorder(
      context,
      borderRadius: 0,
      addBorder: false,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: AppPadding.p12,
      ),
    );
  }
}
