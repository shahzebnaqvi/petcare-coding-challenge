import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petcareapp/app/controllers/main_controller.dart';
import 'package:petcareapp/app/pages/main_screen.dart';
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

  group('MainScreen Widget Tests', () {
    late MainController mainController;

    setUp(() {
      mainController = MainController(MockMediaRepository());
      Get.put(mainController);
    });

    testWidgets('MainScreen displays search bar and results correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: MainScreen(),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text('MOVIE'), findsOneWidget);
      expect(find.text('Movie Title 1'), findsOneWidget);
      expect(find.text('Movie Title 2'), findsOneWidget);
    });

    testWidgets('MainScreen displays loading animation', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: MainScreen(),
        ),
      );

      mainController.isLoading(true);
      await tester.pump();

    });

    testWidgets('MainScreen displays no data animation if no results', (WidgetTester tester) async {
      mainController = MainController(MockMediaRepository());
      Get.put(mainController);

      await tester.pumpWidget(
        GetMaterialApp(
          home: MainScreen(),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      mainController.mediaItems.assignAll([]);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
