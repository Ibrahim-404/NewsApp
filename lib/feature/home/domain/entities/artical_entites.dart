import 'package:news_clean_architecture/feature/home/data/models/source.dart';

class Article {
    Source source;
    String? author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String? content;

    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

}