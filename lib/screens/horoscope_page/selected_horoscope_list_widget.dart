import 'package:flutter/material.dart';
import 'package:puja_path/screens/horoscope_page/widget/horoscope_item_widget.dart';

class SelectedHoroscopeList extends StatefulWidget {
  const SelectedHoroscopeList({Key? key}) : super(key: key);

  @override
  _SelectedHoroscopeListState createState() => _SelectedHoroscopeListState();
}

class _SelectedHoroscopeListState extends State<SelectedHoroscopeList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => HoroscopeItemWidget(index),
            childCount: 2));
  }
}
