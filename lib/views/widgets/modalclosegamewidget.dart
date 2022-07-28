part of 'widgets.dart';

Future modalCloseGameWidget({
  required BuildContext context,
  required VoidCallback onTapBlue,
  required VoidCallback onTapRed,
  String? title,
  String? description,
  String? redButtonText,
  String? blueButtonText,
  Color? background,
}) =>
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => Dialog(
        elevation: 0,
        insetAnimationCurve: Curves.elasticInOut,
        insetAnimationDuration: const Duration(milliseconds: 500),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: background ?? palePink,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? 'Lorem ipsum',
                  style: interheadline3.copyWith(color: davysGrey),
                ),
                Text(
                  description ??
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor.',
                  style: interheadline6.copyWith(color: spanishGray),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    smallButtonWidget(
                      onTap: onTapBlue,
                      text: blueButtonText ?? 'Tidak Jadi',
                      height: 35,
                      width: 110,
                      primaryColor: middleBlue,
                      secondaryColor: vividSkyBlue,
                    ),
                    smallButtonWidget(
                      onTap: onTapRed,
                      text: redButtonText ?? 'Tutup',
                      height: 35,
                      width: 110,
                      primaryColor: salmon,
                      secondaryColor: orangeRedCrayola,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
