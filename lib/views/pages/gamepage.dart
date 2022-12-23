part of 'pages.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GameViewModel>(
      converter: (store) => GameViewModel.create(store),
      builder: (BuildContext context, GameViewModel viewmodel) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              gameAppbarWidget(
                medalBronze: MedalHelper.medalCount(
                        medal: MedalHelper.bronze,
                        listUnitAchived: viewmodel.player!.unitAchived!)
                    .toString(),
                medalSilver: MedalHelper.medalCount(
                        medal: MedalHelper.silver,
                        listUnitAchived: viewmodel.player!.unitAchived!)
                    .toString(),
                medalGold: MedalHelper.medalCount(
                        medal: MedalHelper.gold,
                        listUnitAchived: viewmodel.player!.unitAchived!)
                    .toString(),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: 300,
                  child: ListView(
                    controller: ScrollController(),
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(
                      viewmodel.game!.unit!.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        // color: spanishGray,
                                        width: 150,
                                        height: 100,
                                        child: Image.asset(
                                          'assets/castle.png',
                                        ),
                                      ),
                                      SizedBox(
                                        // color: spanishGray,
                                        width: 200,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/riborn.png',
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                "Unit ${viewmodel.game!.unit![index].level.toString()}",
                                                style: interbutton1.copyWith(
                                                    color: white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Wrap(
                                alignment: WrapAlignment.center,
                                children: viewmodel.game!.unit![index].stage!
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 13, horizontal: 20),
                                        child: gameButtonWidget(
                                          text: e.value.title,
                                          image: e.value.gambar,
                                          isLocked: viewmodel
                                              .isLockedStage!(e.value.id!),
                                          isPlayed: viewmodel
                                              .whichStageAchived!(e.value.id!)
                                              .isPlayed,
                                          medal: viewmodel
                                              .whichStageAchived!(e.value.id!)
                                              .medalAchieved,
                                          onTap: () {
                                            ClickHelper.clickSound();
                                            modalPlayGameWidget(
                                              context: context,
                                              title: e.value.title,
                                              score: ScoreHelper.bestScore(
                                                      scores: viewmodel
                                                          .whichStageAchived!
                                                              (e.value.id!)
                                                          .scores)
                                                  ?.toInt(),
                                              medal: viewmodel
                                                  .whichStageAchived!
                                                      (e.value.id!)
                                                  .medalAchieved,
                                              isPlayed: viewmodel
                                                  .whichStageAchived!
                                                      (e.value.id!)
                                                  .isPlayed,
                                              onTap: () {
                                                ClickHelper.clickSound();

                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  '/ingamepage',
                                                  (route) => false,
                                                  arguments: {
                                                    'quizzes': QuizHelper
                                                        .filteredQuizzes(
                                                            quizzes:
                                                                e.value.quiz!),
                                                    'stageAchived': viewmodel
                                                            .whichStageAchived!(
                                                        e.value.id!),
                                                    'unitAchived': viewmodel
                                                        .player!
                                                        .unitAchived![index],
                                                    'positionUnit': viewmodel
                                                        .game!.unit![index],
                                                    'positionStage': e.value,
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        );
      },
    );
  }
}
