import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../backend/utils/custom_switch_loading_api.dart';
import '../../../../controller/categories/virtual_card/flutter_wave/card_details_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/appbar/appbar_widget.dart';
import '../../../../widgets/others/preview/details_row_widget.dart';

class CardDetailsScreen extends StatelessWidget {
  CardDetailsScreen({super.key});
  final controller = Get.put(CardDetailsController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBarWidget(text: Strings.details),
        body: Obx(
          () => controller.isLoading
              ? CustomLoadingAPI(
                  color: CustomColor.primaryLightColor,
                )
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.9,
      ),
      child: Column(
        children: [
          _amountWidget(context),
          _cardDetailsWidget(context),
        ],
      ),
    );
  }

  _amountWidget(BuildContext context) {
    var data = controller.cardDetailsModel.data;
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          color: CustomColor.primaryLightColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5)),
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.2),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          CustomTitleHeadingWidget(
            text: '${data.myCards.amount} ${data.baseCurr}',
            textAlign: TextAlign.center,
            style: CustomStyle.darkHeading1TextStyle.copyWith(
              fontSize: Dimensions.headingTextSize4 * 2,
              fontWeight: FontWeight.w800,
              color: CustomColor.primaryTextColor,
            ),
          ),
          verticalSpace(Dimensions.heightSize * 0.5),
          TitleHeading4Widget(
            text: Strings.currentAmount,
            textAlign: TextAlign.center,
            color: CustomColor.primaryTextColor.withOpacity(0.6),
          ),
          verticalSpace(Dimensions.heightSize * 0.4),
        ],
      ),
    );
  }

  _cardDetailsWidget(BuildContext context) {
    var myCards = controller.cardDetailsModel.data.myCards;

    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 0.4),
      decoration: BoxDecoration(
          color: CustomColor.primaryLightColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5)),
      child: Column(crossAxisAlignment: crossStart, children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSize * 0.7,
            bottom: Dimensions.paddingSize * 0.3,
            left: Dimensions.paddingSize * 0.7,
            right: Dimensions.paddingSize * 0.7,
          ),
          child: TitleHeading3Widget(
            text: Strings.cardInformation,
            textAlign: TextAlign.left,
          ),
        ),
        Divider(
          thickness: 1,
          color: CustomColor.primaryLightScaffoldBackgroundColor,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSize * 0.3,
            bottom: Dimensions.paddingSize * 0.6,
            left: Dimensions.paddingSize * 0.7,
            right: Dimensions.paddingSize * 0.7,
          ),
          child: Column(
            children: [
              DetailsRowWidget(
                variable: Strings.cardType,
                value: myCards.cardType,
              ),
              DetailsRowWidget(
                variable: "CVV/CVC",
                value: myCards.cvv,
              ),
              DetailsRowWidget(
                variable: "Expiration",
                value: myCards.expiration,
              ),
              DetailsRowWidget(
                variable: "City",
                value: myCards.city,
              ),
              DetailsRowWidget(
                variable: "State",
                value: myCards.state,
              ),
              DetailsRowWidget(
                variable: "Address",
                value: myCards.address,
              ),
              DetailsRowWidget(
                variable: "Zip Code",
                value: myCards.zipCode,
              ),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  CustomTitleHeadingWidget(
                    text: "Freeze Card",
                    style: CustomStyle.darkHeading4TextStyle.copyWith(
                      color: CustomColor.primaryTextColor.withOpacity(0.4),
                    ),
                  ),
                  Obx(
                    () => controller.isCardStatusLoading
                        ? CustomSwitchLoading(
                            color: CustomColor.whiteColor,
                          )
                        : Switch(
                            activeColor: CustomColor.whiteColor,
                            inactiveThumbColor: CustomColor.whiteColor,
                            value: controller.isSelected.value,
                            onChanged: ((value) {
                              controller.isSelected.toggle();
                              controller.cardToggle;
                            }),
                          ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
