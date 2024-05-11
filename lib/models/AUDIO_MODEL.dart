class AUDIO_MODEL {
  final int audio_id;
  final String audio_name;
  final String audio_url;

  const AUDIO_MODEL({
    required this.audio_id,
    required this.audio_name,
    required this.audio_url,
  });

  Map<String, dynamic> toMap() {
    return {
      'audio_id': audio_id,
      'audio_name': audio_name,
      'audio_url': audio_url,
    };
  }

  factory AUDIO_MODEL.fromMap(Map<String, dynamic> map) {
    return AUDIO_MODEL(
      audio_id: map['audio_id'],
      audio_name: map['audio_name'] ?? '',
      audio_url: map['audio_url'] ?? '',
    );
  }
}
