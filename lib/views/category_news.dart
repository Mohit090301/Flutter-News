import 'package:flutter/material.dart';
import 'package:flutter_news/blog_tile.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/helper/news.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles;
  bool _loading = true;
  String categoryText;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
    categoryText = widget.category;
    String first = categoryText[0].toString().toUpperCase();
    String second = categoryText.substring(1, categoryText.length);
    categoryText = "";
    categoryText = first + second;
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categoryText,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Text(
              ' News',
              style: TextStyle(color: Colors.blue[900], fontSize: 26),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          ),
        ],
        elevation: 0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            )
          : Container(
              color: Colors.white70,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  child: Column(
                    children: [
                      Container(
                        child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageURL: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh, color: Colors.white),
        onPressed: () {
          print('Refresh');
          setState(() {
            _loading = true;
            getCategoryNews();
          });
        },
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
