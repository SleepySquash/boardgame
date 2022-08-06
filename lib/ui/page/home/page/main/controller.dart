import 'package:get/get.dart';

enum MainTab {
  deck,
  play,
  profile,
}

class MainController extends GetxController {
  final Rx<MainTab> selected = Rx(MainTab.play);
}
