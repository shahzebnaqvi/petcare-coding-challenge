import 'package:get/get.dart';
import 'package:petcareapp/app/routes/app_routes.dart';
import '../pages/main_screen.dart';
import '../pages/detail_screen.dart';
import '../pages/player_screen.dart';
import '../bindings/detail_binding.dart';
import '../bindings/player_binding.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.MAIN, page: () => MainScreen()),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => DetailScreen(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutes.PLAYER,
      page: () => PlayerScreen(),
      binding: PlayerBinding(),
    ),
  ];
}
