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
              padding: const EdgeInsets.symmetric(horizontal: 55)
                  .copyWith(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Selamat Datang',
                            textAlign: TextAlign.center,
                            style: interheadline1.copyWith(color: davysGrey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.asset(
                                "assets/logo.png",
                                fit: BoxFit.fill,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Text(
                            'Di sini kamu perlu memiliki akun untuk dapat menikmati fitur yang tersedia. Jika kamu belum punya akun, kamu perlu menekan tombol buat akun dibawah !',
                            textAlign: TextAlign.center,
                            style: interheadline4.copyWith(color: spanishGray),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      bigButtonWidget(
                        text: "Buat Akun",
                        onTap: () {
                          ClickHelper.clickSound();

                          Navigator.pushNamed(context, '/registerpage');
                        },
                        width: 200,
                      ),
                      const SizedBox(height: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          dividerWidget(text: "atau masuk dengan"),
                          const SizedBox(height: 25),
                          circleButtonWidget(
                            onTap: () {
                              ClickHelper.clickSound();

                              viewModel.signInUsingGoogle!(context);
                            },
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'kamu sudah punya akun? kamu bisa',
                                textAlign: TextAlign.center,
                                style:
                                    interheadline6.copyWith(color: spanishGray),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  ClickHelper.clickSound();

                                  Navigator.pushNamed(context, '/loginpage');
                                },
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: interheadline6.copyWith(
                                      color: cyanProcess),
                                ),
                              )
                            ],
                          ),
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
