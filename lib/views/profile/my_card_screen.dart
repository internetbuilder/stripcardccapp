import 'package:stripcard/backend/utils/custom_loading_api.dart';
import 'package:stripcard/controller/categories/virtual_card/flutter_wave/flutterwave_card_controller.dart';
import 'package:stripcard/controller/categories/virtual_card/stripe_card/stripe_card_controller.dart';
import 'package:stripcard/controller/categories/virtual_card/strowallet_card/strowallelt_info_controller.dart';
import 'package:stripcard/utils/basic_screen_import.dart';
import 'package:stripcard/views/categories/virtual_card/strowallet_card/strowallet_card_screen.dart';
import '../../controller/categories/virtual_card/sudo_card/sudo_my_card_controller.dart';
import '../../controller/navbar/dashboard_controller.dart';
import '../categories/virtual_card/flutter_wave_virtual_card/flutterwave_card_screen.dart';
import '../categories/virtual_card/stripe_card/stripe_create_card_screen.dart';
import '../categories/virtual_card/sudo_virtual_card/sudo_my_card_screen.dart';

class MyCardScreen extends StatelessWidget {
  MyCardScreen({super.key});
  final dashboardController = Get.put(DashBoardController());
  final stripeController = Get.put(StripeCardController());
  final flutterWaveCardController = Get.put(FlutterWaveCardController());
  final sudoController = Get.put(VirtualSudoCardController());
  final strowalletController = Get.put(VirtualStrowalletCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleHeading1Widget(
          text: Strings.myCard,
          fontSize: Dimensions.headingTextSize1,
          fontWeight: FontWeight.w500,
          color: CustomColor.primaryTextColor,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
        leading: Container(),
      ),
      body: Obx(
        () => sudoController.isLoading ||
                stripeController.isLoading ||
                strowalletController.isLoading ||
                flutterWaveCardController.isLoading
            ? CustomLoadingAPI(color: CustomColor.primaryLightColor)
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return dashboardController.dashBoardModel.data.activeVirtualSystem == 'sudo'
        ? SudoVirtualCardScreen(controller: sudoController)
        : dashboardController.dashBoardModel.data.activeVirtualSystem ==
                'stripe'
            ? StripeCreateCardScreen(controller: stripeController)
            : dashboardController.dashBoardModel.data.activeVirtualSystem ==
                    'flutterwave'
                ? FlutterWaveVirtualCardScreen(
                    controller: flutterWaveCardController,
                  )
                : StrowalletCardScreen(controller: strowalletController);
  }
}
