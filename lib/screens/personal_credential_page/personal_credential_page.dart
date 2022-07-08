import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/login_page/login_page.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/toast.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:puja_path/widgets/app_textfield_widget.dart';
import 'package:puja_path/widgets/rashifal_chips_widget.dart';

class PersonalCredentialPage extends StatefulWidget {
  const PersonalCredentialPage({Key? key}) : super(key: key);

  @override
  _PersonalCredentialPageState createState() => _PersonalCredentialPageState();
}

class _PersonalCredentialPageState extends State<PersonalCredentialPage> {
  final AuthAndUserController _controller = Get.find();

  final TextEditingController _fullNameController = TextEditingController();
  DateTime? _dobEng;
  NepaliDateTime? _dobNp;

  int? _selectedGender;

  String _dobText = "Select DOB";

  final List<String> _genderList = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSize.s24,
              ),
              SizedBox(
                child: Container(
                  padding: EdgeInsets.all(AppPadding.p20.r),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: Column(
                    children: [
                      AppTextFieldWidget(
                        text: "Full Name",
                        textFieldHint: "Enter Full Name",
                        textEditingController: _fullNameController,
                      ),
                      SizedBox(
                        height: AppSize.s24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PopupMenuButton(
                              child: Column(
                                children: [
                                  Text(
                                    "Gender",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(fontSize: FontSize.s20.sp),
                                  ),
                                  SizedBox(
                                    height: AppSize.s10,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          _selectedGender != null
                                              ? _genderList[_selectedGender!]
                                              : "Gender",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            size: 12.r,
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    padding: EdgeInsets.all(16.0.r),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: .25,
                                        color: ColorManager.borderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              onSelected: (String value) {
                                _selectedGender = _genderList.indexOf(value);
                                setState(() {});
                              },
                              itemBuilder: (context) {
                                return List.generate(_genderList.length,
                                    (index) {
                                  return PopupMenuItem(
                                    child: Text(_genderList[index]),
                                    value: _genderList[index],
                                  );
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: AppSize.s20,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () async {
                              _dobNp = await showMaterialDatePicker(
                                context: context,
                                initialDate: NepaliDateTime.now(),
                                firstDate: NepaliDateTime(2000),
                                lastDate: NepaliDateTime(2090),
                                initialDatePickerMode: DatePickerMode.day,
                              );


                              _dobEng = _dobNp?.toDateTime();
                              _dobText = _dobNp!.formatDate();
                              setState(() {});
                            },
                            child: Column(
                              children: [
                                Text("Date of  Birth",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(fontSize: AppSize.s20.sp)),
                                SizedBox(
                                  height: AppSize.s10,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    _dobText,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  padding: EdgeInsets.all(16.0.r),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: .25,
                                      color: ColorManager.borderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s48,
                      ),
                      const RashifalListWigdet(),
                      SizedBox(
                        height: AppSize.s48,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20))),
                            onPressed: () async {
                              /*Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => Dashboard()));*/
                              // call register api
                              if (_fullNameController.text.isNotEmpty) {
                                if (_dobEng != null) {
                                  if (_selectedGender != null) {
                                    var body = {
                                      "name": _fullNameController.text,
                                      "email": "",
                                      "countryCode": "977",
                                      "phone": _controller.mobileNumber,
                                      "otp": _controller.otp,
                                      "gender": _genderList[_selectedGender!],
                                      "password": _controller.password,
                                      "deviceName": "",
                                      "deviceType": "",
                                      "deviceToken": "",
                                      "rashi": "Makar",
                                      "dob_ad": _dobNp!.formatDate(),
                                      "dob_bs": _dobEng!.formatDate()
                                      // add bs date here,
                                    };
                                    body.toString();
                                    Result result =
                                        await _controller.registerUser(body);
                                    if (result.isSuccess()) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => LoginPage()));
                                    } else {
                                      errorToast(
                                          "Something went wrong please try again");
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => LoginPage()));
                                    }
                                  } else {
                                    errorToast("Please select gender");
                                  }
                                } else {
                                  errorToast("Please select date of birth");
                                }
                              } else {
                                errorToast("Name cannot be empty");
                              }
                            },
                            child: Text("Submit Details",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400))
                                .addMargin(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 15.r))),
                      ),
                      SizedBox(
                        height: AppSize.s8,
                      )
                    ],
                  ),
                ),
              ).addPadding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s24)),
            ],
          ),
        ),
      ),
    );
  }
}
