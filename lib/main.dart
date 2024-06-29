import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcareapp/app/controllers/base_controller.dart';
import 'package:petcareapp/app/routes/app_pages.dart';
import 'package:petcareapp/app/routes/app_routes.dart';


void main() {
  Get.put(BaseController()); // Initialize BaseController
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pets & Care Code Challenge App',
      initialRoute: AppRoutes.MAIN,
      getPages: AppPages.pages,
    );
  }
}
