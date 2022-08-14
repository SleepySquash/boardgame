import 'package:get/get.dart';

enum MainTab {
  deck,
  play,
  profile,
}

class DashboardController extends GetxController {
  final Rx<MainTab> selected = Rx(MainTab.play);
}
