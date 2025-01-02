part of "../base.dart";

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hint,this.maxLine, this.label, this.isOptional, this.focusNode, this.controller, this.onChanged, this.inputType, this.inputFormatters, this.isEnable, this.errorText, this.textInputAction, this.onEditingComplete, this.regex, this.validationMessage, required this.name, this.instructions, this.emptyMessage, this.isSecure, this.suffix, this.prefix, this.maxLength, this.readOnly, this.onTap, this.suffixIcon, this.validatorExtra, this.autofillHints, this.prefixIcon, this.fillColor, this.isBordered, this.onFieldSubmitted});

  final String? hint;
  final String? label;
  final bool? isOptional;
  final bool? isBordered;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isEnable;
  final String? errorText;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final String? regex;
  final String? validationMessage;
  final String name;
  final Iterable<String>? autofillHints;
  final String? instructions;
  final String? emptyMessage;
  final bool? isSecure;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLine;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final String? Function(String? value)? validatorExtra;
  final ValueChanged<String>? onFieldSubmitted;

  String? validator(String? text) {
    if ((isOptional ?? true) && (text == null || text.isTrimEmpty)) return null;

    if (text == null) return emptyMessage ?? "Please Enter $name.";

    if (text.isTrimEmpty) return emptyMessage ?? "Please Enter $name.";

    if (regex != null) {
      final isMatch = RegExp(regex!).hasMatch(text);

      if (!isMatch) {
        return validationMessage ?? "Please Enter Valid $name.";
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable == false ? 0.8 : 1.0,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: SizerUtil.maxWidth
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp)
        ),
        child: TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          selectionControls: null,
          onTap: onTap,
          readOnly: readOnly ?? false,
          maxLength: maxLength,
          obscureText: isSecure ?? false,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          enabled: isEnable,
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          autofillHints: autofillHints,
          validator: (value) {

            if(validatorExtra != null) {
              final val = validatorExtra!(value);

              if(val != null) {
                return val;
              }
            }

            return validator(value);
          },
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: kBlackColor
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: fillColor != null,
            counter: maxLength != null ? const SizedBox.shrink() : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIcon: suffixIcon,
            // suffixIconColor: context.isDarkMode ? Colors.white : null,
            // prefixIconColor: context.isDarkMode ? Colors.white : null,
            suffix: suffix,
            prefix: prefix,
            prefixIcon: prefixIcon,
            labelText: label,
            errorStyle: TextStyle(
                color:  Colors.red
            ),
            floatingLabelStyle: TextStyle(
                color:  kPrimaryColor
            ),
            labelStyle: TextStyle(
              color:  Colors.grey
            ),
            hintText: hint,
            hintStyle: kDarkGray16Medium,
            contentPadding: EdgeInsets.symmetric(horizontal: 18.sp,vertical: 10.sp),

            // border: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     width: 1,
            //     color: Colors.brown
            //   )
            // )
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10.0),
            //   borderSide: BorderSide(color: Colors.red)
            //   // borderSide: BorderSide(width: 1,color: kBorderColor.withValues(alpha: 0.01)),
            // ),

            enabledBorder: OutlineInputBorder(borderSide: isBordered == false ? BorderSide.none : BorderSide(color: kBorderColor,width: 1), borderRadius: BorderRadius.circular(10.sp)),
            focusedBorder: OutlineInputBorder(borderSide:isBordered == false ? BorderSide.none : BorderSide(color: kPrimaryColor), borderRadius: BorderRadius.circular(10.sp)),
          ),
        ),
      ),
    );
  }
}
