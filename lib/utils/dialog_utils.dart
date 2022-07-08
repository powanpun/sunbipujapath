import 'package:flutter/material.dart';
import 'package:puja_path/utils/values_manager.dart';

class DialogUtils {
  static void showLoadingDialog(context,
      {customMessage: "Loading... Please Wait", dismissable: true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () {
              return dismissable;
            },
            child: Dialog(
              child: Container(
                color: Theme.of(context).cardColor,
                padding: EdgeInsets.all(AppPadding.p12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: AppSize.s12,
                    ),
                    Text(
                      customMessage,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}