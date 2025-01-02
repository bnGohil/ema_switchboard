part of "../base.dart";

enum CustomButtonVariant { primary, secondary, border }

class CustomButton extends StatefulWidget {
   const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      bool? isLoading,
      bool? isActive,
      bool? shrinkWrap,
      CustomButtonVariant? variant, this.padding, this.icon, this.color, this.textColor,this.fontSize})
      : isLoading = isLoading ?? false,
        isActive = isActive ?? true,
        shrinkWrap = shrinkWrap ?? true,
        variant = variant ?? CustomButtonVariant.primary;

  final String text;
  final Widget? icon;
  final GestureTapCallback? onTap;
  final bool isLoading;
  final bool isActive;
  final Color? color;
  final Color? textColor;
  final bool shrinkWrap;
  final double? fontSize;
  final CustomButtonVariant variant;
  final EdgeInsets? padding;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isActive ? 1.0 : 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: widget.isLoading || !widget.isActive ? null : widget.onTap,
        // splashColor: buttonColor.withOpacity(0.1),
        child: Ink(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: SizerUtil.maxWidth
            ),
            padding: widget.padding ?? EdgeInsets.symmetric(vertical: 15.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color ?? kSecondaryColor,
                // border: borderColor != null ? Border.all(color: borderColor!) : null
            ),
            alignment: widget.shrinkWrap ? Alignment.center : null,
            child:
            widget.isLoading ? SizedBox(
              height: 24.sp,
              width: 24.sp,
              child: CircularProgressIndicator(
                color: kActiveTabBGColor,
                strokeWidth: 2,
              ),
            )
            // Text("Loading ...", style: TextStyle(
            //     color: textColor,
            //     fontWeight: FontWeight.w500,
            //     fontSize: 16.sp
            // ))
                :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(widget.icon != null)
                  widget.icon!,

                if(widget.icon != null)
                  SizedBox(
                    width: 5.sp,
                  ),

                Text(widget.text, style: TextStyle(
                 color: widget.textColor ?? kPrimaryTextColor,
                  fontWeight: FontWeight.w700,
                 fontSize: widget.fontSize ?? 18.sp
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
