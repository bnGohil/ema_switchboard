part of "utils.dart";

class Loading extends StatelessWidget {

  const Loading({Key? key, this.color, this.size}) : super(key: key);

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {

    if(kIsWeb){

      return Center(
        child: CupertinoActivityIndicator(animating: true,color: color ?? kInActiveTabBGColor),
      );

    }else{
      return SizedBox(
        height: size ?? 22,
        width: size ?? 22,
        child: Center(
          child: (Platform.isIOS || kIsWeb) ?  CupertinoActivityIndicator(animating: true,color: color ?? kInActiveTabBGColor) : CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(color ?? kInActiveTabBGColor),
          ),
        ),
      );
    }


  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black38,
      child: Center(child: Container(
          padding: const EdgeInsets.all(12),
          decoration:  BoxDecoration(
              color: kThemeColor,
              shape: BoxShape.circle
          ),
          child: const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(strokeWidth: 2.5)))),
    );
  }
}
