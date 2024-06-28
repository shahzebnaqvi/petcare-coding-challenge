import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcareapp/app/utils/file_constraints.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/detail_controller.dart';
import '../routes/app_routes.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailController controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text(controller.item.title)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(FileConstraints.backgroundImage),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${controller.item.imageUrl}',
                height: 250,
                placeholder: (context, url) => Container(
                  height: 250,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(FileConstraints.noImage, height: 150),
              ),
              Text(controller.item.title, style: TextStyle(fontSize: 24)),
              Text(controller.item.description),
              if (controller.item.mediaType == 'movie' ||
                  controller.item.mediaType == 'tv')
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.PLAYER, arguments: controller.item);
                  },
                  child: Text('Play'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
