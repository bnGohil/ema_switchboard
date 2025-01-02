import 'package:flutter/material.dart';

import '../../theme/theme.dart';
class SwitchBoardTextWidget extends StatelessWidget {
  const SwitchBoardTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Images.commonIcons.appHeaderIcons(context),
        Text("WITCHBOARD",style: kBeVietnamProSemiBold40)
      ],
    );
  }
}
