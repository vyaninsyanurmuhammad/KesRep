part of 'pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnBoardingViewModel>(
        converter: (store) => OnBoardingViewModel.create(store),
        onInit: (store) {
          Future.delayed(const Duration(seconds: 5)).whenComplete(
            () => store.dispatch(IsLoadingOnBoardingAction(isLoading: false)),
          );
        },
        builder: (BuildContext context, OnBoardingViewModel viewModel) {
          return (viewModel.isLoading == true)
              ? const LoadingInGameWidget()
              : Scaffold(
                  body: Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 300,
                                  width: 300,
                                  child: Image.asset(
                                    "assets/logo.png",
                                    fit: BoxFit.fill,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: SizedBox(
                                    width: 300,
                                    child: Text(
                                      'Selamat datang para Player',
                                      textAlign: TextAlign.center,
                                      style: interheadline2.copyWith(
                                          color: davysGrey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    'Permainan ini dibuat untuk para player  mendapatkan pengetahuan akan pentingnya identitas seksual dan kesehatan reproduksi',
                                    textAlign: TextAlign.center,
                                    style: interheadline4.copyWith(
                                        color: spanishGray),
                                  ),
                                ),
                              ],
                            ),
                            bigButtonWidget(
                              text: "Dimengerti",
                              onTap: () {
                                ClickHelper.clickSound();

                                viewModel.setInitialScreen!();

                                Navigator.pushNamed(context, '/loadingpage');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
