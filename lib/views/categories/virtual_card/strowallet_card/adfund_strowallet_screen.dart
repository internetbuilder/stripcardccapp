import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../controller/categories/virtual_card/strowallet_card/add_fund_strowallet_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/appbar/appbar_widget.dart';
import '../../../../widgets/inputs/strowallet_fund_keybaord_widget.dart';

class StrowalletAddFundScreen extends StatelessWidget {
   StrowalletAddFundScreen({super.key});
  final controller = Get.put(StrowalletAddFundController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBarWidget(text: Strings.fund),
        body:Obx(() => controller.isLoadingCharge
        ? const CustomLoadingAPI()
        :  _bodyWidget(context),
      )),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        StrowalletAddFundWidget(
          buttonText: Strings.proceed,
        ),
      ],
    );
  }
}
