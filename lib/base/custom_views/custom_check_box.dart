part of "../base.dart";
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.value, required this.onChange, this.title});

  final bool value;
 final String? title;
  final Function(bool) onChange;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChange(!widget.value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 25.sp,
            height: 25.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.value ? const Color(0xff3F3F40) : null,
                border: Border.all(color: kBlackColor)
            ),
            // padding: EdgeInsets.all(2.sp),
            child: widget.value ? Icon(Icons.check_rounded, color: Colors.white, size: 20.sp) : null,
          ),
          SizedBox(
            width: 15.sp,
          ),
          Expanded(
            child: Text(widget.title   ?? "", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              color: kBlackColor
            ),),
          ),
        ],
      ),
    );
  }
}
