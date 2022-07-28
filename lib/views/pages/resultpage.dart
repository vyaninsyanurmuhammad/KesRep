part of 'pages.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ResultViewModel>(
      converter: (store) => ResultViewModel.create(store),
      onInit: (store) {
        Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        store.state.resultState?.result = arguments['score'];
        store.state.resultState?.quizzes = arguments['quizzes'];
        store.state.resultState?.quizzesAnswered = arguments['quizzesAnswered'];

        store.state.resultState?.unitAchived = arguments['unitAchived'];
        store.state.resultState?.stageAchieved = arguments['stageAchived'];
        store.state.resultState?.positionUnit = arguments['positionUnit'];
        store.state.resultState?.positionStage = arguments['positionStage'];
      },
      onDispose: (store) {
        store.dispatch(IsLoadingResultAction(isLoading: false));
      },
      builder: (BuildContext context, ResultViewModel viewModel) {
        return (viewModel.isLoading == true)
            ? const LoadingInGamePage()
            : WillPopScope(
                onWillPop: () async => await modalCloseGameWidget(
                  onTapBlue: () {},
                  onTapRed: () {
                    viewModel.addResultToFirebase!();

                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (route) => false);
                  },
                  context: context,
                ),
                child: Scaffold(
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text(
                              'Lorem ipsum',
                              style: interheadline1.copyWith(color: davysGrey),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.military_tech_outlined,
                                size: 145,
                                color: gold,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Skor Kamu',
                                    style: interheadline3.copyWith(
                                        color: spanishGray),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${viewModel.result}%',
                                      style: interheadline3.copyWith(
                                          color: davysGrey),
                                    ),
                                  )
                                ],
                              ),
                              (viewModel.stageAchieved?.score == null)
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 20,
                                    ),
                              (viewModel.stageAchieved?.score == null)
                                  ? const SizedBox()
                                  : (Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Skor Terbaik Kamu',
                                          style: interheadline3.copyWith(
                                              color: spanishGray),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            viewModel.stageAchieved!.score!
                                                    .toDouble()
                                                    .toString() +
                                                '%',
                                            style: interheadline3.copyWith(
                                                color: davysGrey),
                                          ),
                                        )
                                      ],
                                    )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              bigButtonWidget(
                                text: "Pembahasan",
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/pembahasanpage',
                                    arguments: {
                                      'quizzes': viewModel.quizzes,
                                      'quizzesAnswered':
                                          viewModel.quizzesAnswered,
                                    },
                                  );
                                },
                                primaryColor: naplesYellow,
                                secondaryColor: cyberYellowLow,
                              ),
                            ],
                          ),
                          bigButtonWidget(
                            text: "Lanjutkan",
                            onTap: () {
                              store.dispatch(
                                  IsLoadingResultAction(isLoading: true));
                              Future.delayed(const Duration(seconds: 5))
                                  .whenComplete(() {
                                viewModel.addResultToFirebase!();

                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/homepage', (route) => false);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
