import 'package:stripcard/utils/basic_screen_import.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 0,
    this.height,
    this.buttonColor = CustomColor.primaryLightColor,
    this.buttonTextColor = Colors.white,
    this.shape,
    this.icon,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double? height;
  final Color? buttonColor;
  final Color buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        boxShadow: [
          BoxShadow(
            color: CustomColor.primaryLightColor,
            offset: const Offset(0.0, 0.0),
            blurRadius: 1.0,
            spreadRadius: .2,
          ), //BoxShadow
        ],
      ),
      height: height ?? Dimensions.buttonHeight * 0.8,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                ),
            backgroundColor: buttonColor ?? CustomColor.primaryLightColor,
            side: BorderSide(
              width: borderWidth,
              color: borderColor ?? CustomColor.primaryLightColor,
            ),
          ),
          child: TitleHeading3Widget(
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            text: title,
            fontWeight: FontWeight.w600,
            color: CustomColor.whiteColor,
          )),
    );
  }
}
