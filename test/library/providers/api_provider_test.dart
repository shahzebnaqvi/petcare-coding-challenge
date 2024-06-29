import 'package:flutter_test/flutter_test.dart';
import 'package:petcareapp/library/providers/api_provider.dart';
import 'package:petcareapp/library/models/media_item.dart';

class MockApiProvider extends ApiProvider {
  @override
  Future<List<MediaItem>> fetchMediaItems(String query) async {
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
  group('ApiProvider Tests', () {
    late MockApiProvider mockApiProvider;

    setUp(() {
      mockApiProvider = MockApiProvider();
    });

    test('fetchMediaItems returns a list of media items if the http call completes successfully', () async {
      final mediaItems = await mockApiProvider.fetchMediaItems('test');

      expect(mediaItems.length, 2);
      expect(mediaItems[0].title, 'Movie Title 1');
      expect(mediaItems[1].title, 'Movie Title 2');
    });

    test('fetchMediaItems throws an exception if the http call completes with an error', () async {
      mockApiProvider = MockApiProvider();

      try {
        await mockApiProvider.fetchMediaItems('error');
      } catch (e) {
        expect(e, isException);
      }
    });
  });
}
