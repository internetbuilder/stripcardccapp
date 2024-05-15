import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../controller/categories/virtual_card/strowallet_card/strowallelt_info_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/appbar/appbar_widget.dart';
import '../../../../widgets/inputs/input_with_text.dart';
import '../../../../widgets/inputs/primary_input_filed.dart';
import '../../../../widgets/inputs/strowallet_flipcard.dart';

class CrateStrowalletScreen extends StatelessWidget {
  CrateStrowalletScreen({super.key});
  final controller = Get.put(VirtualStrowalletCardController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: Strings.createCard),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
    }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.7),
      children: [
         _imageWidget(context),
         _amountFields(context),
         _limitBalance(context),
         _inputWidget(context),
         _chargeWidget(context),
         _buttonWidget(context),
      ],
    );
  }

  _imageWidget(BuildContext context) {
    return StrowalletFlipCardWidget(
      title: Strings.visa,
      availableBalance: Strings.cardHolder,
      cardNumber: 'xxxx xxxx xxxx xxxx',
      expiryDate: 'xx/xx',
      balance: 'xx',
      validAt: 'xx',
      cvv: 'xxx',
      logo: Assets.logo.appLauncher.path,
      isNetworkImage: false,
    );
  }

  _amountFields(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.paddingSize),
      child: Column(
        children: [
          PrimaryInputWidget(
            hint: Strings.enterCardHolderSName,
            label: Strings.cardHolderSName,
            controller: controller.cardHolderNameController,
          ),
          verticalSpace(Dimensions.heightSize),
          InputWithText(
            controller: controller.fundAmountController,
            hint: Strings.zero00,
            label: Strings.fundAmount,
            suffixText: controller.strowalletCardModel.data.userWallet.currency,
            onChanged: (value) {
              controller.getStrowalletCardInfo();
            },
          ),
        ],
      ),
    );
  }
 
  _limitBalance(BuildContext context) {
    var userData = controller.strowalletCardModel.data.userWallet;
    var limitData = controller.strowalletCardModel.data.cardCharge;
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical * 0.3,
        bottom: Dimensions.marginSizeVertical * 2,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            children: [
              const TitleHeading4Widget(
                text: Strings.limit,
                color: CustomColor.primaryLightColor,
              ),
              TitleHeading4Widget(
                text:
                    ": ${limitData.minLimit} ${userData.currency} - ${limitData.maxLimit} ${userData.currency}",
                color: CustomColor.primaryLightColor,
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 0.3),
          Row(
            children: [
              const TitleHeading4Widget(
                text: Strings.balance,
                color: CustomColor.primaryLightColor,
              ),
              TitleHeading4Widget(
                text: ": ${userData.balance} ${userData.currency}",
                color: CustomColor.primaryLightColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Visibility(
      visible: controller.strowalletCardModel.data.user.strowalletCustomer == ""
          ? true
          : false,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Row(
              children: [
                Expanded(
                  child: PrimaryInputWidget(
                    hint: Strings.enterFirstName,
                    label: Strings.firstName,
                    controller: controller.firstNameController,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Expanded(
                  child: PrimaryInputWidget(
                    hint: Strings.enterLastName,
                    label: Strings.lastName,
                    controller: controller.lastNameController,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
              keyboardInputType: TextInputType.number,
              hint: Strings.enterHouseNumber,
              label: Strings.houseNumber,
              controller: controller.houseNumberController,
            ),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
              keyboardInputType: TextInputType.emailAddress,
              hint: Strings.enterCustomerEmail,
              label: Strings.customerEmail,
              controller: controller.emailController,
            ),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
              keyboardInputType: TextInputType.number,
              hint: Strings.enterPhoneNumber,
              label: Strings.phoneNumber,
              controller: controller.phoneController,
            ),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
              // keyboardInputType: TextInputType.text,
              hint: Strings.enterDateOfBirth,
              label: Strings.dateOfBirth,
              controller: controller.dateOfBirthController,
            ),
            verticalSpace(Dimensions.heightSize),
            //passport

            verticalSpace(Dimensions.heightSize),
            Row(
              children: [
                Expanded(
                  child: PrimaryInputWidget(
                    hint: Strings.line1,
                    label: Strings.line1,
                    controller: controller.lineController,
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Expanded(
                  child: PrimaryInputWidget(
                    // keyboardInputType: TextInputType.text,
                    hint: Strings.enterZipCode,
                    label: Strings.zipCode,
                    controller: controller.zipcodeController,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize),
          ],
        ),
      ),
    );
  }

  _chargeWidget(BuildContext context) {
    var userData = controller.strowalletCardModel.data.userWallet;
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            const TitleHeading4Widget(text: Strings.totalCharge),
            Obx(
              () => TitleHeading4Widget(
                text: "${controller.totalCharge.value} ${userData.currency}",
                fontSize: Dimensions.headingTextSize5,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.4),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TitleHeading4Widget(text: Strings.totalPay),
            Obx(
              () => TitleHeading4Widget(
                text: "${controller.totalPay.value} ${userData.currency}",
                fontSize: Dimensions.headingTextSize5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.paddingSize * 1.4,
          bottom: Dimensions.paddingSize * 4.8),
      child: Obx(
        () => controller.isBuyCardLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.confirm,
                onPressed: () {
                  controller.buyCardProcess(context);
                },
                borderColor: CustomColor.primaryLightColor,
                buttonColor: CustomColor.primaryLightColor,
              ),
      ),
    );
  }
}
