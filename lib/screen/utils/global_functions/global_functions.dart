import 'package:admin_ambient/screen/utils/responsive/responsive.dart';

enum DisplayType { web, table, mobile }

imageCalculateWidth(Responsive responsive) {
  if (responsive.isTablet) return responsive.wp(25);
  if (responsive.isWeb) return responsive.wp(50);
  if (responsive.isMobile) return responsive.wp(0);
}

imageCalculateWidthHome(Responsive responsive) {
  if (responsive.width >= 1110) return DisplayType.web;
  if (responsive.width < 1110 && responsive.width >= 601) {
    return DisplayType.table;
  }
  if (responsive.width <= 600) return DisplayType.mobile;
}

paddingCalculateWidth(Responsive responsive) {
  if (responsive.isTablet) return responsive.wp(5);
  if (responsive.isWeb) return responsive.wp(10);
  if (responsive.isMobile) return responsive.wp(5);
}

enum CustomAutenticationBodyType { login, logup }
