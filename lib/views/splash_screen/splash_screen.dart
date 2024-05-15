import 'package:stripcard/backend/utils/custom_loading_api.dart';
import 'package:stripcard/controller/app_settings/app_settings_controller.dart';
import 'package:stripcard/utils/basic_screen_import.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../language/language_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppSettingsController());
  final languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Obx(
          () => controller.isLoading
              ? CustomLoadingAPI(color: Theme.of(context).primaryColor)
              : Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CachedNetworkImage(
                        imageUrl: controller.splashImagePath.value,
                        placeholder: (context, url) => const Text(''),
                        errorWidget: (context, url, error) => const Text(''),
                      ),
                      Visibility(
                        visible: languageController.isLoading ||
                            controller.isVisible.value,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.sizeOf(context).height * 0.2,
                            left: MediaQuery.sizeOf(context).width * 0.15,
                            right: MediaQuery.sizeOf(context).width * 0.15,
                          ),
                          child: LinearProgressIndicator(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
