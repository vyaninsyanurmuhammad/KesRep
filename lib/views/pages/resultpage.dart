part of 'pages.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ResultViewModel>(
      converter: (store) => ResultViewModel.create(store),
      onInit: (store) async {
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
            ? const LoadingInGameWidget()
            : WillPopScope(
                onWillPop: () async => await modalCloseGameWidget(
                  title: "Ingin memastikan saja",
                  description:
                      "Apa kamu yakin ingin keluar dari permainan? skor yang kamu dapat akan disimpan",
                  blueButtonText: "Batal",
                  redButtonText: "Yakin!",
                  onTapBlue: () {
                    ClickHelper.clickSound();

                    Navigator.of(context).pop();
                  },
                  onTapRed: () {
                    ClickHelper.clickSound();

                    viewModel.addResultToFirebase!();

                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (route) => false);
                  },
                  context: context,
                ),
                child: Scaffold(
                  body: Center(
                    child: Stack(
                      children: [
                        const RotatedBox(
                          quarterTurns: -2,
                          child: RiveAnimation.asset(
                            "assets/confetti.riv",
                            artboard: "Ergebniso1.svg",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 45),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Text(
                                  'Permainan\nSelesai',
                                  textAlign: TextAlign.center,
                                  style:
                                      interheadline1.copyWith(color: davysGrey),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.military_tech_outlined,
                                    size: 145,
                                    color: ScoreHelper.scoreDecider(
                                                score: viewModel.result!
                                                    .toInt()) ==
                                            MedalHelper.bronze
                                        ? gold
                                        : ScoreHelper.scoreDecider(
                                                    score: viewModel.result!
                                                        .toInt()) ==
                                                MedalHelper.silver
                                            ? silver
                                            : cyberYellow,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Skor Kamu Sekarang',
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      miniScoreBoxWidget(
                                        score:
                                            "${viewModel.stageAchieved?.scores?[0].toDouble().toString() ?? viewModel.result}%",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      miniScoreBoxWidget(
                                        title: "Skor Terbaik",
                                        backgroundTitle: saffron,
                                        backgroundScore: mediumChampagne,
                                        score:
                                            "${viewModel.bestScore.toString() == "0.0" ? viewModel.result : viewModel.bestScore.toString()}%",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              bigButtonWidget(
                                text: "Pembahasan",
                                onTap: () {
                                  ClickHelper.clickSound();

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
                              bigButtonWidget(
                                text: "Lanjutkan",
                                onTap: () {
                                  ClickHelper.clickSound();

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
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
