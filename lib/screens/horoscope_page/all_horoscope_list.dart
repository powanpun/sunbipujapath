import 'package:flutter/material.dart';
import 'package:puja_path/screens/horoscope_page/widget/horoscope_item_widget.dart';

class AllHoroscopeList extends StatefulWidget {
  const AllHoroscopeList({Key? key}) : super(key: key);

  @override
  _AllHoroscopeListState createState() => _AllHoroscopeListState();
}

class _AllHoroscopeListState extends State<AllHoroscopeList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => HoroscopeItemWidget(index),
            childCount: 12));
  }
}
