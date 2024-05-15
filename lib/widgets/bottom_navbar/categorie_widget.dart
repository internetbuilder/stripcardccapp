import 'package:stripcard/utils/basic_screen_import.dart';
import 'package:stripcard/views/others/custom_image_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
  });
  final String icon, text;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: mainMin,
        children: [
          CircleAvatar(
            radius: 27.r,
            backgroundColor: CustomColor.whiteColor.withOpacity(0.06),
            child: CustomImageWidget(
              path: icon,
              height: Dimensions.heightSize * 2,
              width: Dimensions.widthSize * 2.2,
              color: color,
            ),
          ),
          verticalSpace(Dimensions.heightSize * 0.3),
          Container(
            width: MediaQuery.sizeOf(context).width*0.18,
            child: CustomTitleHeadingWidget(
              text: text,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomStyle.darkHeading5TextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.headingTextSize5,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
