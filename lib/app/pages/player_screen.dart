import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcareapp/app/utils/file_constraints.dart';
import '../controllers/player_controller.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlayerController controller = Get.find();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(FileConstraints.backgroundImage),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/w500${controller.item.imageUrl}',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset(FileConstraints.noImage, height: 150),
          ),
        ),
      ),
    );
  }
}
