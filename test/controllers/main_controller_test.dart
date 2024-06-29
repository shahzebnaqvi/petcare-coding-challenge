import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petcareapp/app/controllers/main_controller.dart';
import 'package:petcareapp/library/models/media_item.dart';
import 'package:petcareapp/library/repositories/media_repository.dart';

class MockMediaRepository extends MediaRepository {
  @override
  Future<List<MediaItem>> getMediaItems(String query) async {
    return [
      MediaItem(
        id: 1,
        mediaType: 'movie',
        title: 'Movie Title 1',
        imageUrl: '/path1.jpg',
        description: 'Description 1',
      ),
      MediaItem(
        id: 2,
        mediaType: 'movie',
        title: 'Movie Title 2',
        imageUrl: '/path2.jpg',
        description: 'Description 2',
      ),
    ];
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;

  group('MainController Tests', () {
    late MainController mainController;
    late MockMediaRepository mockRepository;

    setUp(() {
      mockRepository = MockMediaRepository();
      mainController = MainController(mockRepository);
    });

    test('fetchMediaItems sets mediaItems and isLoading correctly', () async {
      expect(mainController.isLoading.value, false);
      expect(mainController.mediaItems.isEmpty, true);

      await mainController.fetchMediaItems('movie');

      expect(mainController.isLoading.value, false);
      expect(mainController.mediaItems.length, 2);
    });

    test('fetchMediaItems handles errors gracefully', () async {
      mainController = MainController(MockMediaRepository());
      Get.put(mainController);

       mainController.fetchMediaItems('error');

      expect(mainController.isLoading.value, true);
      expect(mainController.mediaItems.isEmpty, true);
    });
  });
}
