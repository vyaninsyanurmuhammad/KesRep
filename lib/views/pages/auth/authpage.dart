part of 'authpages.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      converter: (store) => AuthViewModel.create(store),
      builder: (BuildContext context, AuthViewModel viewModel) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 30)
                  .copyWith(top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit.',
                        textAlign: TextAlign.center,
                        style: interheadline1.copyWith(color: davysGrey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: silver,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor. Duis aliquam ex lacus, et finibus nibh bibendum sodales.',
                        textAlign: TextAlign.center,
                        style: interheadline4.copyWith(color: spanishGray),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      bigButtonWidget(
                        text: "Buat Akun",
                        onTap: () {
                          Navigator.pushNamed(context, '/registerpage');
                        },
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      dividerWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      circleButtonWidget(
                        onTap: () {
                          viewModel.signInUsingGoogle!(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet,',
                            textAlign: TextAlign.center,
                            style: interheadline6.copyWith(color: spanishGray),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/loginpage');
                            },
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style:
                                  interheadline6.copyWith(color: cyanProcess),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
