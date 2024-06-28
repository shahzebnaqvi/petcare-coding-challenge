import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/media_item.dart';

abstract class ApiProvider {
  Future<List<MediaItem>> fetchMediaItems(String query);
}

class ApiProviderImpl extends ApiProvider {
  final String apiKey = '3d0cda4466f269e793e9283f6ce0b75e';
  final String baseUrl = 'https://api.themoviedb.org/3';

  @override
  Future<List<MediaItem>> fetchMediaItems(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search/multi?api_key=$apiKey&query=$query'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['results'];
      return data.map((item) => MediaItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load media items');
    }
  }
}
