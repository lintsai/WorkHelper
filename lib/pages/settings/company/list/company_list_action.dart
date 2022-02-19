import 'package:navigation_bar/model/company_row_vo.dart';

class CompanyListAction{
  static List<CompanyRowVo> getCompanyList(){
    return [
      CompanyRowVo("承暉科技-管理部", ["成員"]),
      CompanyRowVo("承暉科技-研發部", ["管理員", "成員"]),
      CompanyRowVo("承暉娛樂-坤特", ["管理員", "成員"]),
    ];
  }
}