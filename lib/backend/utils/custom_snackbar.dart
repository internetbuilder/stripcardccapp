import 'package:stripcard/language/language_controller.dart';
import 'package:stripcard/utils/basic_screen_import.dart';

class CustomSnackBar {
  static success(String message) {
    return Get.snackbar( Get.find<LanguageController>().getTranslation(Strings.successSnack), Get.find<LanguageController>().getTranslation(message),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.5,
            vertical: Dimensions.marginSizeVertical * 0.5),
        backgroundColor: CustomColor.thirdLightTextColor,
        colorText: CustomColor.whiteColor,
        leftBarIndicatorColor: CustomColor.greenColor,
        progressIndicatorBackgroundColor: Colors.red,
        isDismissible: true,
        animationDuration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 5.0,
        mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const TitleHeading4Widget(text: Strings.dismiss)),
        // boxShadows: BoxShadow()
        icon: const Icon(
          Icons.check_circle_rounded,
          color: CustomColor.greenColor,
        ));
  }

  static error(String message) {

    return Get.snackbar(Get.find<LanguageController>().getTranslation( Strings.alert),Get.find<LanguageController>().getTranslation(message),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.5,
            vertical: Dimensions.marginSizeVertical * 0.5),
        backgroundColor: CustomColor.thirdLightTextColor,
        colorText: CustomColor.whiteColor,
        leftBarIndicatorColor: CustomColor.redColor,
        progressIndicatorBackgroundColor: CustomColor.redColor,
        isDismissible: true,
        animationDuration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 5.0,
        mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const TitleHeading4Widget(text: Strings.dismiss)),
        // boxShadows: BoxShadow()
        icon: const Icon(
          Icons.warning,
          color: CustomColor.redColor,
        ));
  }
}
