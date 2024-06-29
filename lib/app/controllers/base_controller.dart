import 'dart:ui';

import 'package:get/get.dart';

class BaseController extends GetxController {
  Rx<TextDirection> textDirection = Rx<TextDirection>(TextDirection.ltr);

  void toggleDirection() {
    textDirection.value = textDirection.value == TextDirection.ltr
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
