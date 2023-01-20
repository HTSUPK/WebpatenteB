import 'package:flutter/cupertino.dart';
import 'package:webpatente/base/base_stateful_widget.dart';
import 'package:webpatente/resources/color_resources.dart';

class WebPatenteProScreen extends StatefulWidget {
  const WebPatenteProScreen({Key? key}) : super(key: key);

  @override
  State<WebPatenteProScreen> createState() => _WebPatenteProScreenState();
}

class _WebPatenteProScreenState extends BaseStatefulWidgetState<WebPatenteProScreen> {

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Column();
  }
}
