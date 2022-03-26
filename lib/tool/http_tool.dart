import 'dart:convert';

import 'package:http/http.dart';
import 'package:navigation_bar/dao/http_result_model.dart';

class HttpTool {
  static Future<T?> getPosts<T extends HttpResultModel>() async {
    String postsURL = "https://jsonplaceholder.typicode.com/posts";
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      return null;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
