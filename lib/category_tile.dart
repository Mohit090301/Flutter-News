import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:flutter_news/views/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String imageURL, categoryName;

  CategoryTile({this.imageURL, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                    imageUrl: imageURL,
                    width: 150,
                    height: 95,
                    fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 150,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black38,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
