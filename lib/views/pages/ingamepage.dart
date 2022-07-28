part of 'pages.dart';

class InGamePage extends StatelessWidget {
  const InGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InGameViewModel>(
      converter: (store) => InGameViewModel.create(store),
      onInit: (store) {
        Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        store.state.ingameState?.quizzes = arguments['quizzes'];
        store.state.ingameState?.unitAchived = arguments['unitAchived'];
        store.state.ingameState?.stageAchieved = arguments['stageAchived'];
        store.state.ingameState?.positionUnit = arguments['positionUnit'];
        store.state.ingameState?.positionStage = arguments['positionStage'];

        Future.delayed(const Duration(seconds: 5)).whenComplete(
          () => store.dispatch(IsLoadingAction(isLoading: false)),
        );
      },
      onDispose: (store) {
        store.dispatch(IsLoadingAction(isLoading: true));
      },
      builder: (BuildContext context, InGameViewModel viewModel) {
        return (viewModel.isLoading == true)
            ? const LoadingInGamePage()
            : WillPopScope(
                onWillPop: () async => await modalCloseGameWidget(
                  context: context,
                  blueButtonText: "Batal",
                  redButtonText: "Yakin!",
                  onTapBlue: () {
                    Navigator.pop(context);
                  },
                  onTapRed: () {
                    viewModel.clearInGameAndRecordAction!();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (route) => false);
                  },
                ),
                child: Scaffold(
                  backgroundColor: white,
                  body: Column(
                    children: [
                      inGameAppbarWidget(
                        context: context,
                        model: viewModel,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: PageView(
                            controller: viewModel.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: viewModel.quizzes!
                                .map(
                                  (e) => (e.tipe == 'textandtext')
                                      ? textTextQuestion(
                                          quiz: e,
                                          viewModel: viewModel,
                                        )
                                      : (e.tipe == 'imageandtext')
                                          ? imageTextQuestion(
                                              quiz: e,
                                              viewModel: viewModel,
                                            )
                                          : (e.tipe == 'imageandimage')
                                              ? imageImageQuestion(
                                                  quiz: e,
                                                  viewModel: viewModel,
                                                )
                                              : textImageQuestion(
                                                  quiz: e,
                                                  viewModel: viewModel,
                                                ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            bigButtonWidget(
                              onTap: () {
                                viewModel.backQuiz!();
                              },
                              width: 150,
                              text: 'Sebelumnya',
                              isDisable: (viewModel.numberOfQuestion ==
                                          viewModel.quizzes?.length
                                              .toDouble() ||
                                      viewModel.numberOfQuestion! < 2)
                                  ? true
                                  : false,
                              primaryColor: mediumAquamarineLow,
                              secondaryColor: mediumAquamarine,
                            ),
                            bigButtonWidget(
                              onTap: () async {
                                if (viewModel.numberOfQuestion ==
                                        viewModel.quizzes?.length.toDouble() ||
                                    viewModel.numberOfQuestion! > 9.0) {
                                  await modalCloseGameWidget(
                                    context: context,
                                    background: lemonMeringue,
                                    redButtonText: "Yakin!",
                                    onTapBlue: () {
                                      Navigator.pop(context);
                                    },
                                    onTapRed: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/resultpage',
                                        (route) => false,
                                        arguments: {
                                          'score': viewModel.quizScore!(),
                                          'quizzes': viewModel.quizzes,
                                          'quizzesAnswered':
                                              viewModel.quizzesAnswered,
                                          'unitAchived': viewModel.unitAchived,
                                          'stageAchived':
                                              viewModel.stageAchieved,
                                          'positionUnit':
                                              viewModel.positionUnit,
                                          'positionStage':
                                              viewModel.positionStage,
                                        },
                                      );
                                      viewModel.clearInGameAndRecordAction!();
                                    },
                                  );
                                } else {
                                  viewModel.nextQuiz!();
                                }
                              },
                              width: 150,
                              text: (viewModel.numberOfQuestion ==
                                          viewModel.quizzes?.length
                                              .toDouble() ||
                                      viewModel.numberOfQuestion! > 9.0)
                                  ? 'Selesai'
                                  : 'Berikutnya',
                              isDisable: false,
                              primaryColor: (viewModel.numberOfQuestion ==
                                          viewModel.quizzes?.length
                                              .toDouble() ||
                                      viewModel.numberOfQuestion! > 9.0)
                                  ? naplesYellow
                                  : mediumAquamarineLow,
                              secondaryColor: (viewModel.numberOfQuestion ==
                                          viewModel.quizzes?.length
                                              .toDouble() ||
                                      viewModel.numberOfQuestion! > 9.0)
                                  ? cyberYellowLow
                                  : mediumAquamarine,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
