import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/model/company_setting_permission_row_vo.dart';

class CompanySettingPermissionAction {
  static List<CompanySettingPermissionRowVo> getPermissionList() {
    List<String> personList = _getCompanyPersonList();
    return [
      CompanySettingPermissionRowVo(I18nUtil.parse("companySettingPermission.manager"), personList),
      CompanySettingPermissionRowVo(I18nUtil.parse("companySettingPermission.member"), personList),
      CompanySettingPermissionRowVo(I18nUtil.parse("companySettingPermission.accessReport"), personList),
    ];
  }

  static List<String> _getCompanyPersonList() {
    return [
      "Alex",
      "Lin",
      "Jeff",
      "Hacky",
    ];
  }
}
