import 'package:flutter/material.dart';
import 'package:flutter_news/views/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageURL, title, desc, url;

  BlogTile(
      {@required this.imageURL,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogURL: url)));
      },
      child: Card(
        color: Colors.white60,
        margin: EdgeInsets.only(bottom: 20),
        child: Container(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imageURL)),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.1,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 1.1,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
