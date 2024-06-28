import 'package:get/get.dart';
import '../../library/models/media_item.dart';

class PlayerController extends GetxController {
  late MediaItem item;

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments as MediaItem;
  }
}
