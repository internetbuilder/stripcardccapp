import 'package:stripcard/controller/navbar/deposit/deposit_controller.dart';
import 'package:stripcard/language/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../routes/routes.dart';
import '../../../utils/custom_color.dart';
import '../../../widgets/appbar/appbar_widget.dart';
import '../../../widgets/others/congratulation_widget.dart';

class AutomaticWebViewScreen extends StatelessWidget {
  AutomaticWebViewScreen({
    super.key,
    required this.title,
    required this.paymentUrl,
  });

  final controller = Get.put(DepositController());
  final String title;
  final String paymentUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: title,
        onTap: () {
          Get.offAllNamed(Routes.bottomNavBarScreen);
        },
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.bottomNavBarScreen);
              },
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode
                    ? CustomColor.whiteColor
                    : CustomColor.whiteColor,
              ))
        ],
      ),
      body: Obx(
        () => controller.isLoading
            ? CustomLoadingAPI(
                color: CustomColor.primaryLightColor,
              )
            : _bodyWidget(context),
      ),
    );
  }
  
  _bodyWidget(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(paymentUrl)),
      onWebViewCreated: (InAppWebViewController controller) {},
      onProgressChanged: (InAppWebViewController controller, int progress) {},
      onLoadStop: (controller, url) {
        if (url.toString().contains('perfectMoney/payment/success/')) {
          StatusScreen.show(
            context: context,
            subTitle: Strings.yourMoneyAddedSucces.tr,
            onPressed: () {
              Get.offAllNamed(Routes.bottomNavBarScreen);
            },
          );
        }
      },
    );
  }
}
