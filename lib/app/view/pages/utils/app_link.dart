import 'package:eventus/app/view/pages/utils/app_icon.dart';
import 'package:eventus/app/view/pages/utils/app_launch.dart';
import 'package:flutter/material.dart';

class AppLink extends StatelessWidget {
  final String? url;
  final String? tooltipMsg;
  final IconData? icon;
  const AppLink({
    Key? key,
    required this.url,
    this.icon = AppIconData.linkOn,
    this.tooltipMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url != null && url!.isNotEmpty
        ? IconButton(
            tooltip: tooltipMsg,
            onPressed: () async {
              AppLaunch.launchLink(url!);
            },
            icon: Icon(icon))
        : Container(
            width: 1,
          );
  }
}
