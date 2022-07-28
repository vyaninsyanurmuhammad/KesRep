part of 'widgets.dart';

Widget inGameAppbarWidget({
  required BuildContext context,
  InGameViewModel? model,
}) {
  return SizedBox(
    height: 75,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      modalCloseGameWidget(
                        blueButtonText: "Batal",
                        redButtonText: "Yakin!",
                        onTapBlue: () {
                          Navigator.pop(context);
                        },
                        onTapRed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/homepage', (route) => false);

                          model!.clearInGameAndRecordAction!();
                        },
                        context: context,
                      );
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: davysGrey,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  progressbarWidget(
                    height: 20,
                    totalFinished: model!.appbarTotalFinished!(),
                    totalQuestion: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      reviewBottomSheetWidget(
                        context: context,
                      );
                    },
                    child: Icon(
                      Icons.grid_on_rounded,
                      color: caribbeanGreen,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 55,
            height: 45,
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
