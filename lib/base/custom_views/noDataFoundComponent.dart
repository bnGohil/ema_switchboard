
import 'package:flutter/material.dart';
import 'package:switchboard/utils/utils.dart';
import '../../theme/theme.dart';


class NoDataFoundComponent extends StatelessWidget {
  const NoDataFoundComponent({super.key, this.message, this.onRetry});

  final String? message;
  final GestureTapCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message ?? "No Data Found", style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp
        ),),

        if(onRetry != null)
        Column(
          children: [
            const SizedBox(
              height: 10
            ),

            InkWell(
              onTap: onRetry,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5),
                   border: Border.all(color: kPrimaryColor)
                 ),
                  child: Text("Retry",style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500
                  ),)),
            ),
          ],
        )

      ],
    ));
  }
}