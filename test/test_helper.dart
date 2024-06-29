import 'package:get/get.dart';
import 'package:petcareapp/app/controllers/base_controller.dart';
import 'package:petcareapp/app/controllers/main_controller.dart';
import 'package:petcareapp/library/providers/api_provider.dart';
import 'package:petcareapp/library/repositories/media_repository.dart';

class TestHelper {
  static void init() {
    Get.put<MainController>(MainController(MediaRepositoryImpl(ApiProviderImpl())));
    Get.put<BaseController>(BaseController());

  }
}
