import '/controller/categories/virtual_card/flutter_wave/flutter_wave_card_create_controller.dart';
import '/widgets/others/preview/amount_preview_widget.dart';
import '/widgets/others/preview/information_amount_widget.dart';
import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../controller/categories/virtual_card/flutter_wave/adfund_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/appbar/appbar_widget.dart';

class AddFundPreviewScreen extends StatelessWidget {
  AddFundPreviewScreen({super.key});
  final controller = Get.put(AddFundController());
  final cardChargesController = Get.put(CreateCardController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: Scaffold(
      appBar: AppBarWidget(text: Strings.preview),
      body: Obx(
        () => cardChargesController.isLoading
            ? CustomLoadingAPI(
                color: CustomColor.primaryLightColor,
              )
            : _bodyWidget(context),
      ),
    ));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.8),
      physics: BouncingScrollPhysics(),
      children: [
        _amountWidget(context),
        _amountInformationWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _amountWidget(BuildContext context) {
    var data = cardChargesController.cardChargesModel.data;

    return previewAmount(
        amount: "${controller.amountTextController.text} ${data.baseCurr}");
  }

  _amountInformationWidget(BuildContext context) {
    var data = cardChargesController.cardChargesModel.data;
    var _cardCharge = data.cardCharge;
    double amount = double.parse(controller.amountTextController.text);
    double cardChare = double.parse(_cardCharge.fixedCharge.toString());
    double percentCharge = (amount / 100) * _cardCharge.percentCharge;
    double totalPayable = amount + (cardChare + percentCharge);
    double totalCharge = cardChare + percentCharge;

    return amountInformationWidget(
      information: Strings.amountInformation,
      enterAmount: Strings.enterAmount,
      exChange: Strings.exchangeRate,
      exChangeRow: " 1 ${data.baseCurr} = 1 ${data.baseCurr}",
      enterAmountRow:
          "${controller.amountTextController.text} ${data.baseCurr}",
      fee: Strings.transferFee,
      feeRow: "${totalCharge} ${data.baseCurr}",
      received: Strings.recipientReceived,
      receivedRow: "${amount.toStringAsFixed(2)} ${data.baseCurr}",
      total: Strings.totalPayable,
      totalRow: "${totalPayable.toString()} ${data.baseCurr}",
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical * 2,
      ),
      child: Obx(
        () => controller.isLoading
            ? CustomLoadingAPI(
                color: CustomColor.primaryLightColor,
              )
            : PrimaryButton(
                title: Strings.confirm,
                onPressed: () {
                  controller.addFundProcess(context);
                }),
      ),
    );
  }
}
