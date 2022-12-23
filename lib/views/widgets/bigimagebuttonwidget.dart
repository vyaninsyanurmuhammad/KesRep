part of 'widgets.dart';

Widget bigImageButtonWidget({
  double? width = 150,
  double? height = 150,
  String? image,
  Color? primaryColor,
  Color? secondaryColor,
  required VoidCallback onTap,
}) =>
    BigImageButton3D(
      image: image,
      onPressed: onTap,
      width: width,
      height: height,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );

class BigImageButton3D extends StatefulWidget {
  final VoidCallback onPressed;
  final String? image;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final Color? secondaryColor;

  const BigImageButton3D({
    Key? key,
    required this.onPressed,
    this.width,
    this.height,
    this.primaryColor,
    this.secondaryColor,
    this.image,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BigImageButton3DState();
}

class BigImageButton3DState extends State<BigImageButton3D> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.secondaryColor ?? nonPhotoBlue,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Transform.translate(
      offset: Offset(0, (isTapped == true) ? 0 : -5),
      child: Container(
        width: widget.width,
        height: widget.width,
        decoration: BoxDecoration(
          color: widget.primaryColor ?? lightCyan,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(widget.image ?? 'assets/materi/risiko.jpg',
                errorBuilder: (context, exception, stackTrace) {
              return SizedBox(
                width: 180,
                height: 120,
                child: Center(
                  child: Text(
                    "Image Error",
                    style: interheadline3.copyWith(color: davysGrey),
                  ),
                ),
              );
            }, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[_buildBackLayout(), _buildTopLayout()],
      ),
      onTapDown: (TapDownDetails event) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (TapUpDetails event) {
        setState(() {
          isTapped = false;
        });
        widget.onPressed();
      },
    );
  }
}
