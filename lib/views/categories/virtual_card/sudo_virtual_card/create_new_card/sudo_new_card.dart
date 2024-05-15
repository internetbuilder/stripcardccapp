import '../../../../../controller/categories/virtual_card/sudo_card/create_card/sudo_create_card_controller.dart';
import '../../../../../utils/basic_screen_import.dart';
import '../../../../../widgets/appbar/appbar_widget.dart';
import '../../../../../widgets/inputs/sudo_new_card_widget.dart';

class SudoCreateNewScreen extends StatelessWidget {
  SudoCreateNewScreen({super.key});
  final controller = Get.put(SudoCreateCardController());
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
        SudoCreateCardWidget(
          buttonText: Strings.proceed,
        ),
      ],
    );
  }
}
