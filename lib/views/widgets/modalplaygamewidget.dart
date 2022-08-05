part of 'widgets.dart';

Future modalPlayGameWidget({
  required BuildContext context,
  int? score,
  bool? isPlayed = false,
  String? title,
  String? medal,
  required VoidCallback onTap,
}) =>
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => Dialog(
        elevation: 0,
        insetAnimationCurve: Curves.elasticInOut,
        insetAnimationDuration: const Duration(milliseconds: 500),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: lightMint,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                color: mountainMeadow,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Center(
                      child: Text(
                        title ?? 'Lorem ipsum',
                        style: interheadline3.copyWith(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          ClickHelper.clickSound();

                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: davysGrey,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              (isPlayed == true)
                  ? Icon(
                      Icons.military_tech_outlined,
                      color: (medal == 'Gold')
                          ? cyberYellow
                          : (medal == 'Silver')
                              ? silver
                              : (medal == 'Bronze')
                                  ? gold
                                  : white,
                      size: 60,
                    )
                  : Icon(
                      Icons.help_outline_rounded,
                      size: 60,
                      color: davysGrey,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Skor Terbaik',
                    style: interheadline4.copyWith(color: spanishGray),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      (score ?? 0).toString() + '%',
                      style: interheadline4.copyWith(color: davysGrey),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: bigButtonWidget(
                  text: "Mulai",
                  onTap: onTap,
                  width: 135,
                  primaryColor: mediumAquamarineLow,
                  secondaryColor: mediumAquamarine,
                ),
              )
            ],
          ),
        ),
      ),
    );
