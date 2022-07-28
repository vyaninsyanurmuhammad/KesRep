part of 'widgets.dart';

Widget bigButtonWidget({
  String? text,
  double? width = 300,
  double? height = 45,
  Color? primaryColor,
  Color? secondaryColor,
  bool? isDisable = false,
  required VoidCallback onTap,
}) =>
    Button3D(
      text: text,
      onPressed: onTap,
      isDisable: isDisable!,
      width: width,
      height: height,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );

class Button3D extends StatefulWidget {
  final VoidCallback onPressed;
  final String? text;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final Color? secondaryColor;
  final bool isDisable;

  const Button3D({
    Key? key,
    required this.onPressed,
    this.width,
    this.height,
    this.primaryColor,
    this.secondaryColor,
    this.text,
    required this.isDisable,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => Button3DState();
}

class Button3DState extends State<Button3D> {
  bool isTapped = false;

  Widget _buildBackLayout() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: (widget.isDisable == true)
            ? davysGrey
            : widget.secondaryColor ?? ceruleanCrayola,
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
          color: (widget.isDisable == true)
              ? spanishGray
              : widget.primaryColor ?? vividSkyBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            widget.text ?? 'Lorem ipsum',
            textAlign: TextAlign.center,
            style: interbutton1.copyWith(color: eerieBlack),
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
        (widget.isDisable == true)
            ? () {}
            : setState(() {
                isTapped = true;
              });
      },
      onTapCancel: () {
        (widget.isDisable == true)
            ? () {}
            : setState(() {
                isTapped = false;
              });
      },
      onTapUp: (TapUpDetails event) {
        (widget.isDisable == true)
            ? () {}
            : setState(() {
                isTapped = false;
              });
        (widget.isDisable == true) ? () {} : widget.onPressed();
      },
    );
  }
}
