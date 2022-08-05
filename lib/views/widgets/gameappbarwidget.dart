part of 'widgets.dart';

Widget gameAppbarWidget(
    {String? medalBronze, String? medalSilver, String? medalGold}) {
  return Container(
    color: white,
    child: Padding(
      padding: const EdgeInsets.only(top: 30)
          .add(const EdgeInsets.symmetric(horizontal: 30))
          .add(const EdgeInsets.symmetric(vertical: 15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                medalPointWidget(
                  text: medalGold,
                ),
                medalPointWidget(
                  iconColor: silver,
                  text: medalSilver,
                ),
                medalPointWidget(
                  iconColor: gold,
                  text: medalBronze,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  size: 25,
                  color: red,
                ),
                Icon(
                  Icons.all_inclusive_rounded,
                  size: 25,
                  color: red,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
