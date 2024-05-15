import 'package:carousel_slider/carousel_slider.dart';

import '../../controller/categories/virtual_card/flutter_wave/flutterwave_card_controller.dart';
import '../../../controller/navbar/dashboard_controller.dart';
import '../../../utils/basic_screen_import.dart';
import 'card_widget.dart';

class FlutterWaveSlider extends StatelessWidget {
  FlutterWaveSlider({Key? key}) : super(key: key);
  final myCardController = Get.put(FlutterWaveCardController());
  final controller = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    var myCards = myCardController.myCardModel.data.myCards;
    return myCards.isNotEmpty
        ? Obx(
            () {
              return Column(
                children: [
                  CarouselSlider(
                    items: myCards.map((card) {
                      return Builder(
                        builder: (BuildContext context) {
                          return CardWidget(
                            cardNumber: card.cardPan,
                            expiryDate: card.expiration,
                            balance: card.amount.toString(),
                            validAt: card.expiration,
                            cvv: card.cvv,
                            logo: card.siteLogo,
                          );
                        },
                      );
                    }).toList(),
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        controller.current.value = index;
                        myCardController.cardId.value = myCards[index].cardId;
                        debugPrint(myCardController.cardId.value);
                        //! Custom Dot indicator State
                      },
                      height: MediaQuery.of(context).size.height * 0.24,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      aspectRatio: 17 / 8,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: myCardController.myCardModel.data.myCards
                          .asMap()
                          .entries
                          .map(
                        (entry) {
                          return controller.current.value == entry.key
                              ? Container(
                                  width: Dimensions.widthSize * 1,
                                  height: Dimensions.heightSize * 0.6,
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          Dimensions.marginSizeVertical * 0.2,
                                      horizontal:
                                          Dimensions.marginSizeHorizontal *
                                              0.2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColor.whiteColor,
                                  ),
                                )
                              : Container(
                                  width: Dimensions.widthSize * 0.7,
                                  height: Dimensions.heightSize * 0.5,
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          Dimensions.marginSizeVertical * 0.2,
                                      horizontal:
                                          Dimensions.marginSizeHorizontal *
                                              0.2),
                                  decoration: BoxDecoration(
                                    color:
                                        CustomColor.whiteColor.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              );
            },
          )
        : CardWidget(
            cardNumber: 'xxxx xxxx xxxx xxxx',
            expiryDate: 'xx/xx',
            balance: 'xx',
            validAt: 'xx',
            cvv: 'xxx',
            logo: Assets.logo.appLauncher.path,
            isNetworkImage: false,
          );
  }
}
