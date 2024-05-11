class POST_MODEL {
  final int post_id;
  final String post_content;
  final String post_time;

  const POST_MODEL(
      {required this.post_id,
      required this.post_content,
      required this.post_time});

  Map<String, dynamic> toMap() {
    return {
      'post_id': post_id,
      'post_content': post_content,
      'post_time': post_time
    };
  }

  factory POST_MODEL.fromMap(Map<String, dynamic> map) {
    return POST_MODEL(
      post_id: map['post_id'],
      post_content: map['post_content'] ?? '',
      post_time: map['post_time'] ?? '',
    );
  }
}
