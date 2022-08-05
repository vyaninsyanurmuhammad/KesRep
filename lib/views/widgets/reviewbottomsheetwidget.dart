part of 'widgets.dart';

Future reviewBottomSheetWidget({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => StoreConnector<AppState, InGameViewModel>(
        converter: (store) => InGameViewModel.create(store),
        builder: (BuildContext context, InGameViewModel viewmodel) {
          return Container(
            height: 250,
            color: lightMint,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 50,
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 20,
                        children: List.generate(
                          10,
                          (index) => reviewMiniButtonWidget(
                            onTap: () {
                              ClickHelper.clickSound();

                              viewmodel.chooseQuiz!(index);
                            },
                            noSoal: (index + 1).toString(),
                            isAnswered: viewmodel.isQuestionAnswered!(
                                viewmodel.quizzesAnswered!,
                                viewmodel.quizzes!,
                                index),
                            isHere: ((index + 1) ==
                                    viewmodel.numberOfQuestion!.toInt())
                                ? true
                                : false,
                          ),
                        ),
                      ),
                    ),
                    smallButtonWidget(
                      text: "Selesai",
                      primaryColor: naplesYellow,
                      secondaryColor: cyberYellowLow,
                      height: 35,
                      onTap: () async {
                        ClickHelper.clickSound();

                        await modalCloseGameWidget(
                          background: lemonMeringue,
                          title: "Ingin memastikan saja",
                          description:
                              "Apa kamu yakin ingin menyelesaikan permainan? Saya sarankan untuk mengecek kembali jawabanmu",
                          redButtonText: "Yakin!",
                          onTapBlue: () {
                            ClickHelper.clickSound();

                            Navigator.pop(context);
                          },
                          onTapRed: () {
                            ClickHelper.clickSound();

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/resultpage',
                              (route) => false,
                              arguments: {
                                'score': viewmodel.quizScore!(),
                                'quizzes': viewmodel.quizzes,
                                'quizzesAnswered': viewmodel.quizzesAnswered,
                                'unitAchived': viewmodel.unitAchived,
                                'stageAchived': viewmodel.stageAchieved,
                                'positionUnit': viewmodel.positionUnit,
                                'positionStage': viewmodel.positionStage,
                              },
                            );
                            viewmodel.clearInGameAndRecordAction!();
                          },
                          context: context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
