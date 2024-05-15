import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../backend/utils/custom_snackbar.dart';
import '../../../../controller/categories/virtual_card/sudo_card/sudo_my_card_controller.dart';
import '../../../../controller/navbar/dashboard_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/bottom_navbar/categorie_widget.dart';
import '../../../../widgets/bottom_navbar/sudo_slider_card.dart';

class SudoVirtualCardScreen extends StatelessWidget {
  SudoVirtualCardScreen({super.key, required this.controller});
  final VirtualSudoCardController controller;
  final dashboardController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? CustomLoadingAPI(color: CustomColor.primaryDarkColor)
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        mainAxisAlignment: controller.sudoMyCardModel.data.myCard.isNotEmpty
            ? mainStart
            : mainCenter,
        children: [
          _card(context),
          _cardCategories(context),
          if (controller.sudoMyCardModel.data.cardCreateAction) ...[
            _createCard(context),
          ]
        ],
      ),
    );
  }

  _card(BuildContext context) {
    return Visibility(
      visible: controller.sudoMyCardModel.data.myCard.isNotEmpty,
      child: SudoDashboardSlider(),
    );
  }

  _cardCategories(BuildContext context) {
    final data = controller.sudoMyCardModel.data.myCard;
    return Visibility(
      visible: controller.sudoMyCardModel.data.myCard.isNotEmpty,
      child: Container(
        margin: EdgeInsets.only(
            bottom: Dimensions.marginSizeVertical,
            top: Dimensions.marginSizeVertical * 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoriesWidget(
              icon: Assets.icon.details,
              text: Strings.details,
              onTap: () {
                if (controller.sudoMyCardModel.data.myCard.isNotEmpty) {
                  Get.toNamed(Routes.sudoCardDetailsScreen);
                } else {
                  CustomSnackBar.error(Strings.youDonNotBuyCard);
                }
                ;
              },
              color: CustomColor.whiteColor,
            ),
            Obx(() {
              return controller.isDefaultLoading
                  ? CustomLoadingAPI(
                      color: CustomColor.primaryLightColor,
                    )
                  : CategoriesWidget(
                      icon: Assets.icon.fundCard,
                      text: data[dashboardController.current.value].isDefault ==
                              true
                          ? Strings.removeDefault
                          : Strings.makeDefault,
                      color: CustomColor.whiteColor,
                      onTap: () {
                        controller.defaultProcess();
                      });
            }),
            CategoriesWidget(
                icon: Assets.icon.transactionCard,
                text: Strings.transactions,
                color: CustomColor.whiteColor,
                onTap: () {
                  if (controller.sudoMyCardModel.data.myCard.isNotEmpty) {
                    Get.toNamed(Routes.sudoTransactionHistoryScreen);
                  } else {
                    CustomSnackBar.error(
                      Strings.youDonNotBuyCard,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  _createCard(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.sudoCreateNewScreen);
        },
        child: Container(
          alignment: Alignment.center,
          height: Dimensions.heightSize * 4.5,
          width: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.radius * 3.5,
            ),
            border: Border.all(
              color: CustomColor.primaryBGDarkColor,
              width: 2,
            ),
          ),
          child: TitleHeading3Widget(
            text: Strings.createANewCard,
            color: CustomColor.primaryBGDarkColor,
          ),
        ),
      ),
    );
  }
}
