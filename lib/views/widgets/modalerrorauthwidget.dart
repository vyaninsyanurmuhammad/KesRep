part of 'widgets.dart';

Future modalErrorAuthWidget({
  required BuildContext context,
  required VoidCallback onTapRed,
  String? title,
  String? description,
  String? redButtonText,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'Lorem ipsum',
                      style: interheadline3.copyWith(color: davysGrey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      description ??
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor.',
                      textAlign: TextAlign.center,
                      style: interheadline6.copyWith(color: spanishGray),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallButtonWidget(
                      onTap: onTapRed,
                      text: redButtonText ?? 'Dimengerti',
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
