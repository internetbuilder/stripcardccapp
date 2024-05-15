import 'package:stripcard/widgets/appbar/appbar_widget.dart';
import '../../language/language_drop_down.dart';
import '../../utils/basic_screen_import.dart';
import '../../controller/drawer/change_password_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final controller = Get.put(PasswordController());
  final passwordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBarWidget(text: Strings.settings),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.9,
      ),
      physics: BouncingScrollPhysics(),
      children: [
        verticalSpace(Dimensions.heightSize),
        _changePassword(context),
        _changeLanguageWidget(context),
      ],
    );
  }

  _changeLanguageWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  TitleHeading4Widget(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSize * .2,
                    ),
                    text: Strings.change,
                    fontWeight: FontWeight.normal,
                    fontSize: Dimensions.headingTextSize3,
                    color: CustomColor.whiteColor,
                  ),
                  horizontalSpace(Dimensions.widthSize * 0.5),
                  TitleHeading4Widget(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSize * .2,
                    ),
                    text: Strings.language,
                    fontWeight: FontWeight.normal,
                    fontSize: Dimensions.headingTextSize3,
                    color: CustomColor.whiteColor,
                  ),
                ],
              ),
            ),
            Expanded(child: ChangeLanguageWidget())
          ],
        ),
      ],
    );
  }

  _changePassword(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.changePasswordScreen);
      },
      child: TitleHeading4Widget(
        padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize * .2),
        text: Strings.changePassword,
        fontWeight: FontWeight.normal,
        fontSize: Dimensions.headingTextSize3,
        color: CustomColor.whiteColor,
      ),
    );
  }
}
