class MediaItem {
  final int id;
  final String mediaType;
  final String title;
  final String imageUrl;
  final String description;

  MediaItem({
    required this.id,
    required this.mediaType,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      id: json['id'],
      mediaType: json['media_type'],
      title: json['title'] ?? json['name'],
      imageUrl: json['poster_path'] ?? '',
      description: json['overview'] ?? '',
    );
  }
}
