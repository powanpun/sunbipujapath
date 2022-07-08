import 'package:puja_path/utils/enum_constants.dart';

class DashboardTabModel {
  String tabIcon;
  String title;
  DASHBOARD_TAB tag;
  int id;

  getTitle() => title;
  getTabIcon() => tabIcon;
  getTag() => tag;
  getId() => id;

  DashboardTabModel(this.tabIcon, this.title, this.tag, {this.id = 0});
}
