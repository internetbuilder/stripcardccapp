import 'package:stripcard/widgets/bottom_navbar/flutter_card.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../controller/categories/virtual_card/flutter_wave/flutterwave_card_controller.dart';
import '../../../../data/flutter_wave_data.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/bottom_navbar/categorie_widget.dart';

class FlutterWaveVirtualCardScreen extends StatelessWidget {
  FlutterWaveVirtualCardScreen({super.key, required this.controller});
  final FlutterWaveCardController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? CustomLoadingAPI(color: CustomColor.primaryLightColor)
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        mainAxisAlignment: controller.myCardModel.data.myCards.isNotEmpty
            ? mainStart
            : mainCenter,
        children: [
          _card(context),
          _cardCategories(context),
          _createCard(context),
        ],
      ),
    );
  }

  _card(BuildContext context) {
    return FlutterWaveSlider();
  }

  _cardCategories(BuildContext context) {
    return Visibility(
      visible: controller.myCardModel.data.myCards.isNotEmpty,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
        child: GridView.count(
          padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.3),
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 3.0,
          shrinkWrap: true,
          children: List.generate(
            flutterCategoriesData.length,
            (index) => CategoriesWidget(
              onTap: flutterCategoriesData[index].onTap,
              icon: flutterCategoriesData[index].icon,
              text: flutterCategoriesData[index].text,
              color: CustomColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  _createCard(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.createNewScreen);
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
