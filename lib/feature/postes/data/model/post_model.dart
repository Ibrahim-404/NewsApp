import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

class PostModel extends Post {
  @override
  final int? id;
  @override
  final String title;
  final String content;

  PostModel({
    this.id,
    required this.title,
    required this.content,
  }) : super(id: id, title: title, body: content);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'] ?? 'No title',
      content: json['body'] ?? 'No body',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': content, 
    };
  }

  Post toEntity() {
    return Post(
      id: id,
      title: title,
      body: content,
    );
  }

  factory PostModel.fromEntity(Post post) {
    return PostModel(
      id: post.id,
      title: post.title,
      content: post.body,
    );
  }
}
