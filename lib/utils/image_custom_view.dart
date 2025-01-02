part of 'utils.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({Key? key, required this.uri, this.fit, this.placeholder, this.color}) : super(key: key);

  final String? uri;
  final BoxFit? fit;
  final Widget? placeholder;
  final Color? color;

  @override
  Widget build(BuildContext context) {

    final url = Uri.tryParse(uri ?? "");

    if(url?.isAbsolute == false) {
      return placeholder ?? Container(
          decoration: BoxDecoration(
              border: Border.all(color: kInActiveTabBGColor),
              borderRadius: BorderRadius.circular(15)
          ),
          child: Icon(Icons.image_search,color: kInActiveTabBGColor,));
    }

    if(kIsWeb){
      return  Image.network(uri ?? "",
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, url, error) => placeholder ?? const Icon(Icons.error_outline_rounded),
      );
    }else{
      return CachedNetworkImage(
        fit: fit ?? BoxFit.cover,
        imageUrl: uri ?? "",

        placeholder: (context, url) => Center(child: Platform.isIOS ? const CupertinoActivityIndicator() :  CircularProgressIndicator(color: kPrimaryColor,strokeWidth: 1,)),
        errorWidget: (context, url, error) => placeholder ?? const Icon(Icons.error_outline_rounded),
        color: color,
      );
    }



  }
}

class CustomNonCachedImageView extends StatelessWidget {
  const CustomNonCachedImageView({Key? key, required this.src, this.fit, this.color}) : super(key: key);

  final String src;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {

    return Image.network(src, fit: fit, loadingBuilder: (context, child, loadingProgress) {

      if(loadingProgress == null){
        return child;
      }

      return SizedBox(
        child: Loading(color: color),
      );

    },errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.image, size: 50, color: Colors.white);
    }, frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child);
  }
}
