import '../views/gift_card/create_gift_card_screen.dart';
import '/routes/routes.dart';
import '/views/auth/login/otp_verification_screen.dart';
import '/views/auth/registration/email_otp_screen.dart';
import '/views/auth/registration/sign_up_screen.dart';
import '/views/categories/deposit/web_payment_screen.dart';
import '/views/categories/withdraw/withdraw_manual_payment_screen.dart';
import '/views/categories/withdraw/withdraw_preview_screen.dart';
import '/views/drawer/change_password_screen.dart';
import '/views/navbar/bottom_navbar_screen.dart';
import '/views/navbar/dashboard_screen.dart';
import '/views/navbar/notification_screen.dart';
import '/views/onboard/onboard_screen.dart';
import '/views/profile/my_card_screen.dart';
import '/views/profile/update_profile_screen.dart';
import 'package:get/get.dart';
import '../backend/services/api_endpoint.dart';
import '../bindings/splash_screen_binding.dart';
import '../language/strings.dart';
import '../views/auth/login/reset_password_screen.dart';
import '../views/auth/login/signin_screen.dart';
import '../views/categories/deposit/coingate_webview_screen.dart';
import '../views/categories/deposit/deposit_preview_screen.dart';
import '../views/categories/deposit/deposit_screen.dart';
import '../views/categories/deposit/flutterwave_webview_screen.dart';
import '../views/categories/deposit/manual_payment_screen.dart';
import '../views/categories/deposit/qrpay_webview_screen.dart';
import '../views/categories/deposit/razorpay_webview_screen.dart';
import '../views/categories/deposit/sslcommerz_webview_screen.dart';
import '../views/categories/deposit/stripe_web_view_screen.dart';
import '../views/categories/deposit/tatum/tatum_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/add_fund_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/card_details_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/create_newcard_preview_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/create_newcard_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/fund_preview_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/transaction_history_screen.dart';
import '../views/categories/virtual_card/stripe_card/stripe_card_details_screen.dart';
import '../views/categories/virtual_card/stripe_card/stripe_transaction_screen.dart';
import '../views/categories/virtual_card/strowallet_card/adfund_strowallet_screen.dart';
import '../views/categories/virtual_card/strowallet_card/strowallet_details_screen.dart';
import '../views/categories/virtual_card/strowallet_card/strowallet_new_card_screen.dart';
import '../views/categories/virtual_card/strowallet_card/strowallet_transacton.dart';
import '../views/categories/virtual_card/sudo_virtual_card/create_new_card/sudo_card_preview.dart';
import '../views/categories/virtual_card/sudo_virtual_card/create_new_card/sudo_new_card.dart';
import '../views/categories/virtual_card/sudo_virtual_card/sudo_card_details_screen.dart';
import '../views/categories/virtual_card/sudo_virtual_card/sudo_transaction_history_screen.dart';
import '../views/categories/withdraw/withdraw_screen.dart';
import '../views/drawer/settings.dart';
import '../views/drawer/transaction_log_screen.dart';
import '../views/drawer/web_view_screen.dart';
import '../views/gift_card/all_gift_card_screen.dart';
import '../views/gift_card/gift_card_screen.dart';
import '../views/kyc/kyc_screen.dart';
import '../views/money_transfer/transfer_preview_screen.dart';
import '../views/splash_screen/splash_screen.dart';

class RoutePageList {
  static var list = [
    //!auth
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardScreen(),
    ),

    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.resetOtpScreen,
      page: () => ResetOtpScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: Routes.emailOtpScreen,
      page: () => EmailOtpScreen(),
    ),

    //!categories
    GetPage(
      name: Routes.bottomNavBarScreen,
      page: () => BottomNavBarScreen(),
      // binding: BottomNavBarScreenBinding(),
    ),
    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => NotificationScreen(),
    ),

    GetPage(
      name: Routes.depositScreen,
      page: () => DepositScreen(),
    ),
    GetPage(
      name: Routes.depositPreviewScreen,
      page: () => DepositPreviewScreen(),
    ),

    //help center
    GetPage(
      name: Routes.helpCenter,
      page: () => WebViewScreen(
        title: Strings.helpCenter,
        url: "${ApiEndpoint.mainDomain}/contact",
      ),
    ),

    //privacy policy
    GetPage(
      name: Routes.privacyPolicy,
      page: () => WebViewScreen(
        title: Strings.privacyAndPolicy,
        url: "${ApiEndpoint.mainDomain}/page/privacy-policy",
      ),
    ),

    //about us
    GetPage(
      name: Routes.aboutUs,
      page: () => WebViewScreen(
        title: Strings.aboutUs,
        url: "${ApiEndpoint.mainDomain}/about",
      ),
    ),
    //!drawer screens

    GetPage(
      name: Routes.transactionLogScreen,
      page: () => TransactionLogScreen(),
    ),

    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),

    //!profile screen

    GetPage(
      name: Routes.mygiftCardScreen,
      page: () => MyCardScreen(),
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.manualPaymentScreen,
      page: () => ManualPaymentScreen(),
    ),
    GetPage(
      name: Routes.webPaymentScreen,
      page: () => WebPaymentScreen(),
    ),

    GetPage(
      name: Routes.kycScreen,
      page: () => KycScreen(),
    ),

    ///>>>>>>>>>>>> stripe card screen
    GetPage(
      name: Routes.stripeCardDetailsScreen,
      page: () => StripeCardDetailsScreen(),
    ),
    GetPage(
      name: Routes.stripeTransactionHistoryScreen,
      page: () => StripeTransactionHistoryScreen(),
    ),
    GetPage(
      name: Routes.moneyTransferPreviewScreen,
      page: () => MoneyTransferPreviewScreen(),
    ),

    GetPage(
      name: Routes.stripeWebPaymentScreen,
      page: () => StripeWebPaymentScreen(),
    ),
    //money out
    GetPage(
      name: Routes.moneyOutScreen,
      page: () => MoneyOutScreen(),
    ),
    GetPage(
      name: Routes.moneyOutManualPaymentScreen,
      page: () => MoneyOutManualPaymentScreen(),
    ),
    GetPage(
      name: Routes.moneyOutPreviewScreen,
      page: () => MoneyOutPreviewScreen(),
    ),
    GetPage(
      name: Routes.flutterWebPaymentScreen,
      page: () => FlutterWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.sslCommerzWebPaymentScreen,
      page: () => SslCommerzWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.razorPayWebPaymentScreen,
      page: () => RazorPayWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.qrPayWebPaymentScreen,
      page: () => QrPayWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.coinWebPaymentScreen,
      page: () => CoinWebPaymentScreen(),
    ),

    // sudo card pages
    GetPage(
      name: Routes.sudoCreateNewScreen,
      page: () => SudoCreateNewScreen(),
    ),
    GetPage(
      name: Routes.sudoCreateNewCardPreviewScreen,
      page: () => SudoCreateNewCardPreviewScreen(),
    ),
    GetPage(
      name: Routes.createNewCardPreviewScreen,
      page: () => CreateNewCardPreviewScreen(),
    ),
    GetPage(
      name: Routes.sudoCardDetailsScreen,
      page: () => SudoCardDetailsScreen(),
    ),

    GetPage(
      name: Routes.createNewScreen,
      page: () => CreateNewScreen(),
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: Routes.addFundScreen,
      page: () => AddFundScreen(),
    ),
    GetPage(
      name: Routes.cardDetailsScreen,
      page: () => CardDetailsScreen(),
    ),
    GetPage(
      name: Routes.transactionHistoryScreen,
      page: () => TransactionHistoryScreen(),
    ),
    GetPage(
      name: Routes.addFundPreviewScreen,
      page: () => AddFundPreviewScreen(),
    ),
    GetPage(
      name: Routes.sudoTransactionHistoryScreen,
      page: () => SudoTransactionHistoryScreen(),
    ),
    GetPage(
      name: Routes.tatumPaymentScreen,
      page: () => TatumPaymentScreen(),
    ),

    GetPage(
      name: Routes.strowalletCardDetailsScreen,
      page: () => StrowalletCardDetailsScreen(),
    ),
    GetPage(
      name: Routes.strowalletTransactionHistoryScreen,
      page: () => StrowalletTransactionHistoryScreen(),
    ),
    GetPage(
      name: Routes.strowalletAddFundScreen,
      page: () =>  StrowalletAddFundScreen(),
    ),
    GetPage(
      name: Routes.crateStrowalletScreen,
      page: () => CrateStrowalletScreen(),
    ),
    // GetPage(
    //   name: Routes.sudoAddFundScreen,
    //   page: () => SudoAddFundScreen(),
    // ),


    //>>>>>>>>>> gift card
    GetPage(
      name: Routes.giftCardScreen,
      page: () => GiftCardScreen(),
    ),
    GetPage(
      name: Routes.allGiftCardScreen,
      page: () => AllGiftCardScreen(),
    ),
    GetPage(
      name: Routes.createGiftCardScreen,
      page: () => CreateGiftCardScreen(),
    ), 
  ];
}
