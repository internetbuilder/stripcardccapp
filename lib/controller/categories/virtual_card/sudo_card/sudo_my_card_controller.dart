import 'package:stripcard/utils/basic_screen_import.dart';

import '../../../../../backend/model/common/common_success_model.dart';
import '../../../../../backend/model/virtual_card/sudo_models/sudo_card_model.dart';
import '../../../../../backend/services/api_services.dart';
import '../../../../backend/local_storage.dart';
import '../../../navbar/dashboard_controller.dart';

class VirtualSudoCardController extends GetxController {
  final dashboardController = Get.put(DashBoardController());
  RxDouble percentCharge = 0.0.obs;
  RxDouble fixedCharge = 0.0.obs;
  RxDouble rate = 0.0.obs;
  RxDouble totalFee = 0.0.obs;
  RxString cardId = "".obs;
  RxString baseCurrency = "".obs;
  RxDouble limitMin = 0.0.obs;
  RxDouble limitMax = 0.0.obs;
  List<String> baseCurrencyList = [];
  RxInt activeIndicatorIndex = 0.obs;

  @override
  void onInit() {
    dashboardController.getDashboardData().then((value) {
      if (dashboardController.dashBoardModel.data.activeVirtualSystem ==
          'sudo') {
        getCardData();
      }
    });

    super.onInit();
  }

  changeIndicator(int value) {
    activeIndicatorIndex.value = value;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late SudoMyCardModel _sudoMyCardModel;
  SudoMyCardModel get sudoMyCardModel => _sudoMyCardModel;

  Future<SudoMyCardModel> getCardData() async {
    _isLoading.value = true;
    update();

    await ApiServices.sudoCardInfoApi().then((value) {
      _sudoMyCardModel = value!;
      cardId.value =_sudoMyCardModel.data.myCard.isEmpty?"": _sudoMyCardModel.data.myCard.first.cardId;
      baseCurrency.value = _sudoMyCardModel.data.baseCurr;
      baseCurrencyList.add(_sudoMyCardModel.data.baseCurr);

      limitMin.value = _sudoMyCardModel.data.cardCharge.minLimit;
      limitMax.value = _sudoMyCardModel.data.cardCharge.maxLimit;
      percentCharge.value = _sudoMyCardModel.data.cardCharge.percentCharge;
      fixedCharge.value = _sudoMyCardModel.data.cardCharge.fixedCharge;
      rate.value = 1.0;
      LocalStorage.saveVirtualImage(
          virtualImage: _sudoMyCardModel.data.cardBasicInfo.cardBg);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _sudoMyCardModel;
  }

  ///  >>>>>> Start makeOrRemove Default process
  final _isDefaultLoading = false.obs;
  bool get isDefaultLoading => _isDefaultLoading.value;
  late CommonSuccessModel _makeOrRemoveDefault;
  CommonSuccessModel get makeOrRemoveDefault => _makeOrRemoveDefault;

  Future<CommonSuccessModel> defaultProcess() async {
    _isDefaultLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'card_id': cardId.value,
    };
    await ApiServices.sudoCardMakeOrRemoveDefaultApi(body: inputBody)
        .then((value) {
      _makeOrRemoveDefault = value!;
      update();
      getCardData();
      update();
    }).catchError((onError) {
      log.e(onError);
      update();
    });

    _isDefaultLoading.value = false;
    update();
    return _makeOrRemoveDefault;
  }
}
