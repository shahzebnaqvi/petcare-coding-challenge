import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcareapp/app/controllers/base_controller.dart';
import 'package:petcareapp/app/controllers/main_controller.dart';
import 'package:petcareapp/app/routes/app_routes.dart';
import 'package:petcareapp/app/utils/file_constraints.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../library/repositories/media_repository.dart';
import '../../library/providers/api_provider.dart';

class MainScreen extends StatelessWidget {
  final MainController controller =
      Get.put(MainController(MediaRepositoryImpl(ApiProviderImpl())));
  final BaseController baseController = Get.find<BaseController>(); // Retrieve BaseController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pets & Care Code Challenge App'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              baseController.toggleDirection(); // Toggle text direction
            },
          ),
        ],
      ),
      body: Obx(() {
        final textDirection = baseController.textDirection.value;
        return Directionality(
          textDirection: textDirection,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(FileConstraints.backgroundImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onSubmitted: (query) => controller.fetchMediaItems(query),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: Lottie.asset(FileConstraints.searchAnimation),
                      );
                    }
                    final mediaTypes = controller.mediaItems
                        .map((item) => item.mediaType)
                        .toSet()
                        .toList()
                          ..sort();
                    if (mediaTypes.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(FileConstraints.searchNoData, height: 100),
                            Text(
                              "Search For Movie",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: mediaTypes.length,
                      itemBuilder: (context, index) {
                        final mediaType = mediaTypes[index];
                        final items = controller.mediaItems
                            .where((item) => item.mediaType == mediaType)
                            .toList();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                mediaType.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, i) {
                                  final item = items[i];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.DETAIL, arguments: item);
                                    },
                                    child: Card(
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: 'https://image.tmdb.org/t/p/w500${item.imageUrl}',
                                            height: 150,
                                            placeholder: (context, url) => Container(
                                              height: 150,
                                              width: 100,
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
                                                Image.asset(
                                                  FileConstraints.noImage,
                                                  height: 150,
                                                ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              item.title,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
