part of 'widgets.dart';

Widget progressbarWidget({
  double? totalQuestion,
  double? totalFinished,
  double? height,
}) =>
    Expanded(
      child: LinearPercentIndicator(
        lineHeight: height ?? 30,
        animation: true,
        animationDuration: 1200,
        curve: Curves.fastLinearToSlowEaseIn,
        percent: (totalFinished ?? 1) / (totalQuestion ?? 10),
        progressColor: caribbeanGreen,
        backgroundColor: lightCyan,
        barRadius: const Radius.circular(30),
      ),
    );
