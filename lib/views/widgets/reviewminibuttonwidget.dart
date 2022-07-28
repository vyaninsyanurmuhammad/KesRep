part of 'widgets.dart';

Widget reviewMiniButtonWidget({
  required VoidCallback onTap,
  String? noSoal,
  bool? isAnswered = false,
  bool? isHere = false,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isHere == true
              ? mediumAquamarine
              : isAnswered == true
                  ? naplesYellow
                  : middleBlue,
        ),
        child: Center(
          child: Text(
            noSoal ?? '00',
            style: interheadline4.copyWith(
              color: cGBlue,
            ),
          ),
        ),
      ),
    );
