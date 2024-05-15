import '../../../../utils/basic_screen_import.dart';
import '../../../../widgets/appbar/appbar_widget.dart';
import '../../../../widgets/inputs/add_fund_keyborad_widget.dart';

class AddFundScreen extends StatelessWidget {
  AddFundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBarWidget(text: Strings.fund),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        AddFundWidget(
          buttonText: Strings.proceed,
        ),
      ],
    );
  }
}
