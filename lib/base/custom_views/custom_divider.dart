part of "../base.dart";
class CustomDivider extends StatelessWidget {
   final double? height;
  final Color? color;
   const CustomDivider({super.key,this.height,this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height ?? 20.sp),

        Divider(height: 1.sp,color: color ?? kPrimaryTextColor.withOpacity(0.2),),

        SizedBox(height: height ?? 20.sp),
      ],
    );
  }
}
