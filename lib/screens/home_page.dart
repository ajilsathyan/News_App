
import 'package:flutter/material.dart';
import 'package:news_app/components/firstScreenCustomComponent.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF656bd9),   
        title: Text(
          "Today's News",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),

      //  Calling the Api services with futurebuiilder widget
      body: FutureBuilder(
        future: apiServices.getHttpData(),
        builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
          if (snapshot.hasData) {
            List<Articles> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return customWidget(articles[index],context);
                });
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
