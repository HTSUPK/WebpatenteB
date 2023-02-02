import 'package:flutter/material.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../base/base_stateful_widget.dart';

class NetworkOff extends StatefulWidget {
  const NetworkOff({Key? key}) : super(key: key);

  @override
  State<NetworkOff> createState() => _NetworkOffState();
}

class _NetworkOffState extends BaseStatefulWidgetState<NetworkOff> {
  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Network Connection Lost !",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 18,
              color: colorPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Check your internet connection.",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(),
          ),
        ],
      ),
    );
  }
}
