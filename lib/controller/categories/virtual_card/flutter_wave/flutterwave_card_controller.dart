import '../../../../../backend/services/api_services.dart';
import '../../../../backend/local_storage.dart';
import '../../../../backend/model/virtual_card/my_card_model.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../navbar/dashboard_controller.dart';

class FlutterWaveCardController extends GetxController {
  final RxString cardId = ''.obs;
  final dashboardController = Get.put(DashBoardController());
  @override
  void onInit() {
    dashboardController.getDashboardData().then((value) {
      if (dashboardController.dashBoardModel.data.activeVirtualSystem ==
          'flutterwave') {
        getCardData();
      }
    });

    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late FlutterMyCardModel _myCardModel;
  FlutterMyCardModel get myCardModel => _myCardModel;

  Future<FlutterMyCardModel> getCardData() async {
    _isLoading.value = true;
    update();

    await ApiServices.myCardApi().then((value) {
      _myCardModel = value!;
      cardId.value = _myCardModel.data.myCards.isNotEmpty
          ? _myCardModel.data.myCards.first.cardId.toString()
          : '';
      LocalStorage.saveVirtualImage(
          virtualImage: _myCardModel.data.myCards.isNotEmpty
              ? _myCardModel.data.cardBasicInfo.cardBg
              : '');
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _myCardModel;
  } 
}
