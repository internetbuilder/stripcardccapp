import '../../../../controller/categories/virtual_card/flutter_wave/flutter_wave_card_create_controller.dart';
import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/appbar/appbar_widget.dart';
import '../../../../widgets/inputs/create_new_card_widget.dart';

class CreateNewScreen extends StatelessWidget {
  CreateNewScreen({super.key});
  final controller = Get.put(CreateCardController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBarWidget(text: Strings.createANewCard),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        CustomCreateAmountWidget(
          buttonText: Strings.proceed,
        ),
      ],
    );
  }
}
