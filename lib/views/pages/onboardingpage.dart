part of 'pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnBoardingViewModel>(
        converter: (store) => OnBoardingViewModel.create(store),
        builder: (BuildContext context, OnBoardingViewModel viewModel) {
          return Scaffold(
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
                            decoration: BoxDecoration(
                              color: silver,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Lorem ipsum dolor sit.',
                                textAlign: TextAlign.center,
                                style:
                                    interheadline2.copyWith(color: davysGrey),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor. Duis aliquam ex lacus, et finibus nibh bibendum sodales.',
                              textAlign: TextAlign.center,
                              style:
                                  interheadline4.copyWith(color: spanishGray),
                            ),
                          ),
                        ],
                      ),
                      bigButtonWidget(
                        text: "Dimengerti",
                        onTap: () {
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
