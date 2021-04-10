import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=c6a50fe0ddef4031a3d208c9133441fd";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    String url;
    if (category == "world")
      url =
          "https://newsapi.org/v2/top-headlines?language=en&apiKey=c6a50fe0ddef4031a3d208c9133441fd";
    else
      url =
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=c6a50fe0ddef4031a3d208c9133441fd";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
