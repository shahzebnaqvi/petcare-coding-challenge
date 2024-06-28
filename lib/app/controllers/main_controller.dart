import 'package:get/get.dart';
import '../../library/repositories/media_repository.dart';
import '../../library/models/media_item.dart';

class MainController extends GetxController {
  final MediaRepository _mediaRepository;
  var mediaItems = <MediaItem>[].obs;
  var isLoading = false.obs;

  MainController(this._mediaRepository);

  void fetchMediaItems(String query) async {
    isLoading(true);
    try {
      var items = await _mediaRepository.getMediaItems(query);
      mediaItems.assignAll(items);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
