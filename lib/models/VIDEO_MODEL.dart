class VIDEO_MODEL {
  final int video_id;
  final String video_name;
  final String video_url;

  const VIDEO_MODEL({
    required this.video_id,
    required this.video_name,
    required this.video_url,
  });

  Map<String, dynamic> toMap() {
    return {
      'video_id': video_id,
      'video_name': video_name,
      'video_url': video_url,
    };
  }

  factory VIDEO_MODEL.fromMap(Map<String, dynamic> map) {
    return VIDEO_MODEL(
      video_id: map['video_id'],
      video_name: map['video_name'] ?? '',
      video_url: map['video_url'] ?? '',
    );
  }
}
