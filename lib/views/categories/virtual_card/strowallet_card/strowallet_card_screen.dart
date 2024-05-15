import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../backend/utils/custom_snackbar.dart';
import '../../../../controller/categories/virtual_card/strowallet_card/strowallelt_info_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/bottom_navbar/categorie_widget.dart';
import 'strowallet_slider.dart';

class StrowalletCardScreen extends StatelessWidget {
  const StrowalletCardScreen({super.key, required this.controller});
  final VirtualStrowalletCardController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? const CustomLoadingAPI()
          : _bodyWidget(context),
    );
  }

  _stroWalletCardWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.radius * 2,
            ),
            color: CustomColor.primaryLightColor,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.8,
            vertical: Dimensions.marginSizeVertical * 0.4,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * 0.4,
            vertical: Dimensions.paddingSize * 0.4,
          ),
          child: Column(
            mainAxisAlignment: mainCenter,
            mainAxisSize: mainMin,
            children: [
              StrowalletSlider(),
              Visibility(
                visible: controller.strowalletCardModel.data.myCards.isNotEmpty,
                child: GridView.count(
                    padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.3),
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 4,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    childAspectRatio: 0.7,
                    children: [
                      CategoriesWidget(
                          icon: Assets.icon.details,
                          text: Strings.details,
                          color: CustomColor.whiteColor,
                          onTap: () {
                            controller.getStrowalletCardData();
                            if (controller
                                .strowalletCardModel.data.myCards.isNotEmpty) {
                              Get.toNamed(Routes.strowalletCardDetailsScreen);
                            } else {
                              CustomSnackBar.error(Strings.youDonNotBuyCard);
                            }
                          }),
                      CategoriesWidget(
                          icon: Assets.icon.fundCard,
                          text: Strings.fund,
                          color: CustomColor.whiteColor,
                          onTap: () {
                            controller.getStrowalletCardData();
                            if (controller
                                .strowalletCardModel.data.myCards.isNotEmpty) {
                              Get.toNamed(Routes.strowalletAddFundScreen);
                            } else {
                              CustomSnackBar.error(
                                Strings.youDonNotBuyCard,
                              );
                            }
                          }),
                      Obx(
                        () => controller.isMakeDefaultLoading
                            ? const CustomLoadingAPI()
                            : CategoriesWidget(
                                icon: Assets.icon.torch,
                                color: CustomColor.whiteColor,
                                text: controller
                                        .strowalletCardModel
                                        .data
                                        .myCards[controller
                                            .dashboardController.current.value]
                                        .isDefault
                                    ? Strings.removeDefault
                                    : Strings.makeDefault,
                                onTap: () {
                                  controller.makeCardDefaultProcess(
                                    controller
                                        .strowalletCardModel
                                        .data
                                        .myCards[controller
                                            .dashboardController.current.value]
                                        .cardId,
                                  );
                                },
                              ),
                      ),
                      CategoriesWidget(
                        icon: Assets.icon.transactionsLog,
                        text: Strings.transactions,
                        color: CustomColor.whiteColor,
                        onTap: () {
                          controller.getStrowalletCardData();
                          if (controller
                              .strowalletCardModel.data.myCards.isNotEmpty) {
                            Get.toNamed(
                                Routes.strowalletTransactionHistoryScreen);
                          } else {
                            CustomSnackBar.error(
                              Strings.youDonNotBuyCard,
                            );
                          }
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
        if (controller.strowalletCardModel.data.cardCreateAction) ...[
          _buttonWidget(context),
        ]
      ],
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return _stroWalletCardWidget(context);
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 2,
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
      ),
      child: PrimaryButton(
        title: Strings.createANewCard,
        onPressed: () {
          Get.toNamed(Routes.crateStrowalletScreen);
        },
      ),
    );
  }
}
