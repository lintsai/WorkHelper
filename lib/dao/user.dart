import 'package:navigation_bar/dao/http_result_model.dart';

class User extends HttpResultModel{

  User.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}