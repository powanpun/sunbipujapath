import 'package:flutter/material.dart';
import 'package:puja_path/utils/values_manager.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String title;

  HomeHeaderWidget({this.title = "Our Services"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          Icon(
            Icons.arrow_forward,
            size: AppSize.s24,
          )
        ],
      ),
    );
  }
}
