part of 'authpages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      converter: (store) => AuthViewModel.create(store),
      builder: (BuildContext context, AuthViewModel viewModel) {
        return GestureDetector(
          onTap: () {
            viewModel.focusLoginEmail?.unfocus();
            viewModel.focusLoginPassword?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55)
                    .copyWith(top: 60, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayo login masuk !',
                          textAlign: TextAlign.left,
                          style: interheadline2.copyWith(color: davysGrey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Kamu hanya perlu mengisi email dan password yang kamu punya. Jika kamu kesulitan mengisi mintalah bantuan orang disekitarmu !',
                          textAlign: TextAlign.left,
                          style: interheadline4.copyWith(color: spanishGray),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: viewModel.loginFormKey,
                          child: Column(
                            children: [
                              authInputWidget(
                                label: 'Email',
                                controller: viewModel.emailLoginController,
                                validator: (value) =>
                                    ValidatorHelper.validateEmail(email: value),
                                focusNode: viewModel.focusLoginEmail,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              authInputWidget(
                                label: 'Password',
                                icon: Icons.password,
                                controller: viewModel.passwordLoginController,
                                validator: (value) =>
                                    ValidatorHelper.validatePassword(
                                        password: value),
                                focusNode: viewModel.focusLoginPassword,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              bigButtonWidget(
                                text: "Masuk",
                                onTap: () {
                                  ClickHelper.clickSound();

                                  if (viewModel.loginFormKey!.currentState!
                                      .validate()) {
                                    viewModel.signInUsingEmailPassword!(
                                      context,
                                      viewModel.emailLoginController!.text,
                                      viewModel.passwordLoginController!.text,
                                    );
                                    viewModel.focusLoginEmail?.unfocus();
                                    viewModel.focusLoginPassword?.unfocus();

                                    viewModel.clearSignInAction!();
                                  }
                                },
                                width: 200,
                              ),
                              const SizedBox(height: 25),
                              (MediaQuery.of(context).viewInsets.bottom == 0.0)
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        dividerWidget(
                                            text: "atau masuk dengan"),
                                        const SizedBox(height: 25),
                                        circleButtonWidget(
                                          onTap: () {
                                            ClickHelper.clickSound();

                                            viewModel
                                                .signInUsingGoogle!(context);
                                          },
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'kamu belum punya akun? kamu bisa',
                                              textAlign: TextAlign.center,
                                              style: interheadline6.copyWith(
                                                  color: spanishGray),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ClickHelper.clickSound();

                                                Navigator.pushReplacementNamed(
                                                    context, '/registerpage');
                                              },
                                              child: Text(
                                                'Register',
                                                textAlign: TextAlign.center,
                                                style: interheadline6.copyWith(
                                                    color: cyanProcess),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    )
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
