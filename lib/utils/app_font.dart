import 'package:movie_app/utils/common_import.dart';
import 'package:movie_app/utils/utils.dart';

class AppFont {
  static TextStyle listTitle = TextStyle(
      color: AppColors.appBlack, fontSize: 22, fontWeight: FontWeight.w600);

  static TextStyle movieTitle = TextStyle(
      color: AppColors.appPrimary, fontSize: 16, fontWeight: FontWeight.bold);
    
  static TextStyle movieTitleLarg = TextStyle(
      color: AppColors.appPrimary, fontSize: 26, fontWeight: FontWeight.bold);  

  static TextStyle movieYear = TextStyle(
      color: AppColors.appPrimary.withOpacity(0.7),
      fontSize: 14,
      fontWeight: FontWeight.normal);

  static TextStyle movieDes = TextStyle(
    color: AppColors.appBlack.withOpacity(0.5)
  );

  static TextStyle highlitedName = const TextStyle(
    fontSize: 16,
  );

  static TextStyle mobileAppBar = TextStyle(
    color: AppColors.appWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
  );

  static TextStyle webAppBar = TextStyle(
    color: AppColors.appWhite,
              fontSize: 30,
              fontWeight: FontWeight.bold,
  );

}
