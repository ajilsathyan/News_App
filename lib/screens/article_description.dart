import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticleDescription extends StatelessWidget {
  final Articles articles;
  ArticleDescription({this.articles});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 4,
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
                articles.description == null
                    ? "Loading..."
                    : articles.description,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Text('${articles.content}')),
              Expanded(child: Text('Published at ' + articles.publishedAt))
            ],
          ),
        ),
      ),
    );
  }
}
