part of 'widgets.dart';

Widget circleButtonWidget({
  required VoidCallback onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image.asset(
            "assets/google.png",
            fit: BoxFit.fill,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: silver),
        ),
      ),
    );
