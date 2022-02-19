import 'package:navigation_bar/constants/i18n/I18nUtil.dart';
import 'package:navigation_bar/model/company_setting_row_vo.dart';
import 'package:navigation_bar/pages/settings/company/setting/attendance/company_setting_attendance_view.dart';
import 'package:navigation_bar/pages/settings/company/setting/export.report/company_setting_export_report_view.dart';
import 'package:navigation_bar/pages/settings/company/setting/permission/company_setting_permission_view.dart';

import 'pages/company_setting_pages_view.dart';
import 'punch/company_setting_punch_view.dart';

class CompanySettingAction{
  static List<CompanySettingRowVo> getSettingList(String companyName){
    return [
      CompanySettingRowVo(
          I18nUtil.parse("companySetting.permissionManagement"),
          CompanySettingPermissionView(companyName)
      ),
      CompanySettingRowVo(
          I18nUtil.parse("companySetting.pagesManagement"),
          CompanySettingPagesView(companyName)
      ),
      CompanySettingRowVo(
          I18nUtil.parse("companySetting.punchManagement"),
          CompanySettingPunchView(companyName)
      ),
      CompanySettingRowVo(
          I18nUtil.parse("companySetting.attendanceManagement"),
          CompanySettingAttendanceView(companyName)
      ),
      CompanySettingRowVo(
          I18nUtil.parse("companySetting.exportReport"),
          CompanySettingExportReportView(companyName)
      ),
      // CompanySettingRowVo(
      //     I18nUtil.parse("companySetting.orderManagement"),
      //     CompanySettingPermissionView(companyName)
      // ),
    ];
  }
}