import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

const apiKey = "a6cb28c15dd2457bb723af510b70f558";
class ApiServices {
  final url =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey";

  Future<List<Articles>> getHttpData() async {
    Response response = await get(Uri.parse(url));
    var data = response.body;
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(data);
      List<dynamic> jsonbody = json['articles'];
      List<Articles> articles =
          jsonbody.map((dynamic item) => Articles.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
   
  }
}
