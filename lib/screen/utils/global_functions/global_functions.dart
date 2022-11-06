import 'package:admin_ambient/screen/utils/responsive/responsive.dart';


imageCalculateWidth(Responsive responsive){
    if (responsive.isTablet) return responsive.wp(25);
    if (responsive.isWeb) return responsive.wp(50);
    if (responsive.isMobile) return responsive.wp(0);
  }

    paddingCalculateWidth(Responsive responsive){
    if (responsive.isTablet) return responsive.wp(5);
    if (responsive.isWeb) return responsive.wp(10);
    if (responsive.isMobile) return responsive.wp(5);
  }

  enum CustomAutenticationBodyType {
    login,
    logup
  }