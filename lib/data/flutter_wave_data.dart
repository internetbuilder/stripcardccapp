import '../backend/utils/custom_snackbar.dart';
import '../controller/categories/virtual_card/flutter_wave/flutterwave_card_controller.dart';
import '../controller/navbar/navbar_controller.dart';
import '../model/categories_model.dart';
import '../utils/basic_screen_import.dart';

final myCardController = Get.put(FlutterWaveCardController());
final controller = Get.put(NavbarController());

List<CategoriesModel> flutterCategoriesData = [
  CategoriesModel(Assets.icon.detailsCard, Strings.details, () {
    myCardController.getCardData();
    if (myCardController.myCardModel.data.myCards.isNotEmpty) {
      Get.toNamed(Routes.cardDetailsScreen);
    } else {
      CustomSnackBar.error(Strings.youDonNotBuyCard);
    }
  }),
  CategoriesModel(Assets.icon.fundCard, Strings.fund, () {
    myCardController.getCardData();
    if (myCardController.myCardModel.data.myCards.isNotEmpty) {
      Get.toNamed(Routes.addFundScreen);
    } else {
      CustomSnackBar.error(
        Strings.youDonNotBuyCard,
      );
    }
  }),
  CategoriesModel(Assets.icon.transactionCard, Strings.transactions, () {
    myCardController.getCardData();
    if (myCardController.myCardModel.data.myCards.isNotEmpty) {
      Get.toNamed(Routes.transactionHistoryScreen);
    } else {
      CustomSnackBar.error(
        Strings.youDonNotBuyCard,
      );
    }
  }),
];
