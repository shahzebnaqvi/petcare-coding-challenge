import '../providers/api_provider.dart';
import '../models/media_item.dart';

abstract class MediaRepository {
  Future<List<MediaItem>> getMediaItems(String query);
}

class MediaRepositoryImpl extends MediaRepository {
  final ApiProvider _apiProvider;

  MediaRepositoryImpl(this._apiProvider);

  @override
  Future<List<MediaItem>> getMediaItems(String query) {
    return _apiProvider.fetchMediaItems(query);
  }
}
