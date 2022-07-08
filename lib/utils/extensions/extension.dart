import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ExtendedWidget on Widget {
  Widget addPadding({EdgeInsets padding = const EdgeInsets.all(8.0)}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addMargin({
    EdgeInsets margin = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
  }) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  Widget addBorder(
    BuildContext context, {
    margin = const EdgeInsets.all(0),
    padding = const EdgeInsets.all(0),
    double borderRadius = 16,
    Color color = Colors.white,
    Clip clipBehaviour = Clip.none,
    bool addBorder = true,
  }) {
    return Container(
      margin: margin,
      padding: padding,
      clipBehavior: clipBehaviour,
      decoration: BoxDecoration(
        color: color,
        border: addBorder
            ? Border.all(
                color: Theme.of(context).dividerColor,
                width: .25,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: this,
    );
  }

  Widget addShadow() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 6,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: this,
    );
  }
}

extension StringExtension on String {
  bool isValidPassword() {
    String pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(this);
  }
}

extension DateExtension on DateTime {
  String formatDate({String format = "yyyy-MM-dd"}) {
    return DateFormat(format).format(this);
  }
}
