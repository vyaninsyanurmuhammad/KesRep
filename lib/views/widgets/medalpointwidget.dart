part of 'widgets.dart';

Widget medalPointWidget({Color? iconColor, String? text}) => Row(
      children: [
        Icon(
          Icons.military_tech_outlined,
          size: 25,
          color: iconColor ?? cyberYellow,
        ),
        Text(
          text ?? '0',
          style: interheadline3.copyWith(color: spanishGray),
        )
      ],
    );
