import 'package:get/get.dart';

enum MainTab {
  deck,
  game,
  profile,
}

class MainController extends GetxController {
  final Rx<MainTab> selected = Rx(MainTab.game);
}
