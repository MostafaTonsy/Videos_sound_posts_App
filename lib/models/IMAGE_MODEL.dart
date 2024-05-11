class IMAGE_MODEL {
  final int image_id;
  final String image_url;

  const IMAGE_MODEL({
    required this.image_id,
    required this.image_url,
  });

  Map<String, dynamic> toMap() {
    return {
      'image_id': image_id,
      'image_url': image_url,
    };
  }

  factory IMAGE_MODEL.fromMap(Map<String, dynamic> map) {
    return IMAGE_MODEL(
      image_id: map['image_id'],
      image_url: map['image_url'] ?? '',
    );
  }
}
