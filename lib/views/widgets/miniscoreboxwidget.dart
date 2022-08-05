part of 'widgets.dart';

Widget miniScoreBoxWidget({
  String? title,
  String? score,
  Color? backgroundTitle,
  Color? backgroundScore,
}) =>
    Column(
      children: [
        Container(
          width: 120,
          height: 30,
          color: backgroundTitle ?? mountainMeadow,
          child: Center(
            child: Text(title ?? "Skor Pertama",
                style: interbutton2.copyWith(color: white)),
          ),
        ),
        Container(
          width: 120,
          height: 70,
          child: Center(
            child: Text(
              score ?? "50.0%",
              style: interheadline2.copyWith(color: davysGrey),
            ),
          ),
          decoration: BoxDecoration(
            color: backgroundScore ?? magicMint,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ],
    );
