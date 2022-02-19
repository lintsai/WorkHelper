import 'dart:collection';

class I18nUtil {
  static Map<String, String> i18nMap = HashMap();
  static initI18n() {
    i18nMap.putIfAbsent("personalSetting", () => "個人設定");
    i18nMap.putIfAbsent("friendManagement", () => "好友管理");
    i18nMap.putIfAbsent("companyListManagement", () => "公司部門管理");
    i18nMap.putIfAbsent("workspaceManagement", () => "工作區管理");
    i18nMap.putIfAbsent("menuManagement", () => "菜單管理");
    i18nMap.putIfAbsent("nearbyRestaurants", () => "附近餐廳");
    i18nMap.putIfAbsent("settings", () => "Settings");
    i18nMap.putIfAbsent("rateUs", () => "Rate us");


    i18nMap.putIfAbsent("companySetting.permissionManagement", () => "權限管理");
    i18nMap.putIfAbsent("companySetting.pagesManagement", () => "頁面管理");
    i18nMap.putIfAbsent("companySetting.punchManagement", () => "上班打卡");
    i18nMap.putIfAbsent("companySetting.attendanceManagement", () => "請假加班");
    i18nMap.putIfAbsent("companySetting.exportReport", () => "報表匯出");
    i18nMap.putIfAbsent("companySetting.orderManagement", () => "點餐");

    i18nMap.putIfAbsent("companySettingPermission.manager", () => "管理者");
    i18nMap.putIfAbsent("companySettingPermission.member", () => "成員");
    i18nMap.putIfAbsent("companySettingPermission.accessReport", () => "報表調閱權限");


  }

  static String parse(String i18nKey) {
    String? parseString = i18nMap[i18nKey];
    return parseString ?? "";
  }
}
