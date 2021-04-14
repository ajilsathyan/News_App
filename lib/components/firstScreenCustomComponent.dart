import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/article_description.dart';

Widget customWidget(Articles articles, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleDescription(
            articles: articles,
          );
        }));
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: 415,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(articles.urlToImage == null
                        ? "https://thepointsguy.global.ssl.fastly.net/us/originals/2021/04/American-Airlines-Boeing-737-800-Zach-Griff-1.jpeg"
                        : articles.urlToImage),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 25,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF04ee50)),
                child: Text(
                  articles.source.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                articles.title == null ? "Loading..." : articles.title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
