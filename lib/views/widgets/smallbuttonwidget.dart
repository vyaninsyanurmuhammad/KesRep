part of 'widgets.dart';

Widget smallButtonWidget({
  String? text = 'Lorem ipsum',
  double? width = 300,
  double? height = 45,
  Color? primaryColor,
  Color? secondaryColor,
  required VoidCallback onTap,
}) =>
    SmallButton3D(
      text: text,
      onPressed: onTap,
      width: width,
      height: height,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );

class SmallButton3D extends StatefulWidget {
  final VoidCallback onPressed;
  final String? text;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final Color? secondaryColor;

  const SmallButton3D({
    Key? key,
    required this.onPressed,
    this.width,
    this.height,
    this.primaryColor,
    this.secondaryColor,
    this.text,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmallButton3DState();
}

class SmallButton3DState extends State<SmallButton3D> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.secondaryColor ?? ceruleanCrayola,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Transform.translate(
      offset: Offset(0, (isTapped == true) ? 0 : -5),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.primaryColor ?? vividSkyBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            widget.text ?? 'Lorem ipsum',
            textAlign: TextAlign.center,
            style: interbutton2.copyWith(color: eerieBlack),
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
