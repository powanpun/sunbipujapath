import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/values_manager.dart';

class AppTextFieldWidget extends StatefulWidget {
  late String? mText;
  late String? mTextFieldHint;
  late bool? mObscureText;
  late TextEditingController? mTextEditingController;

  AppTextFieldWidget(
      {Key? key,
      required String? text,
      required String? textFieldHint,
      required TextEditingController? textEditingController,
      bool? obscureText})
      : super(key: key) {
    mText = text;
    mTextFieldHint = textFieldHint;
    mObscureText = obscureText;
    mTextEditingController = textEditingController;
  }

  @override
  _AppTextFieldWidgetState createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  bool? isObscureText = false;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.mObscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.mText!,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: FontSize.s18.sp,
                fontWeight: FontWeightManager.regular)),
        SizedBox(
          height: AppSize.s12,
        ),
        Container(
          height: 46.r,
          child: TextField(
            controller: widget.mTextEditingController,
            obscureText: isObscureText!,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: FontSize.s20.sp,
                fontWeight: FontWeightManager.regular),
            decoration: InputDecoration(
              suffixIcon: widget.mObscureText != null
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText!;
                        });
                      },
                      child: Icon(isObscureText!
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )
                  : null,
              hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: FontSize.s16.sp,
                  color: ColorManager.lightGrey,
                  fontWeight: FontWeightManager.regular),
              hintText: widget.mTextFieldHint,
              contentPadding: EdgeInsets.only(left: AppPadding.p12),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(width: .25, color: ColorManager.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(width: .25, color: ColorManager.lightGrey)),
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s38,
        ),
      ],
    );
  }
}
