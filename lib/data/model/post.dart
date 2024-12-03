class Post {
  String id;
  String title;
  String content;
  String writer;
  String imageUrl;
  // DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.writer,
    required this.imageUrl,
    // required this.createdAt,
  });

  //1. formJson 네임드 생성자 만들기
  Post.formJson(Map<String, dynamic> map)
      : this(
          id: map['id'] as String,
          title: map['title'] as String,
          content: map['content'] as String,
          writer: map['writer'] as String,
          imageUrl: map['imageUrl'] as String,
          // createdAt: DateTime.parse(map['createdAt']), // 문자열을 DateTime으로 변환
        );

  //2. toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'writer': writer,
      'imageUrl': imageUrl,
      // 'createdAt': createdAt.toIso8601String(),
    };
  }
}
