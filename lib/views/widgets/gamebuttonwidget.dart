part of 'widgets.dart';

Widget gameButtonWidget({
  bool? isPlayed = false,
  bool? isLocked = true,
  String? text,
  String? medal,
  required VoidCallback onTap,
}) =>
    GestureDetector(
      onTap: (isLocked == true) ? () {} : onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: lightCyan,
                ),
              ),
              (isPlayed == true)
                  ? Positioned(
                      right: -13,
                      bottom: -5,
                      child: Icon(
                        Icons.military_tech_outlined,
                        size: 50,
                        color: (medal == MedalHelper.gold)
                            ? cyberYellow
                            : (medal == MedalHelper.silver)
                                ? silver
                                : (medal == MedalHelper.bronze)
                                    ? gold
                                    : white,
                      ),
                    )
                  : const SizedBox(),
              (isLocked == true)
                  ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: eerieBlack.withOpacity(0.5),
                      ),
                    )
                  : const SizedBox(),
              (isLocked == true)
                  ? Positioned.fill(
                      child: Icon(
                        Icons.lock,
                        size: 30,
                        color: eerieBlack,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              text ?? 'Lorem ipsum',
              style: interheadline5.copyWith(color: davysGrey),
            ),
          ),
        ],
      ),
    );
