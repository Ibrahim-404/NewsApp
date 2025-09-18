import 'package:news_clean_architecture/feature/home/data/models/article.dart';

class NewsModel {
    String status;
    int totalResults;
    List<Article> articles;

    NewsModel({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

}




