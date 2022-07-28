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
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 30)
                        .copyWith(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem ipsum dolor sit.',
                          textAlign: TextAlign.left,
                          style: interheadline2.copyWith(color: davysGrey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra non odio quis auctor.',
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
                    Flexible(
                      child: SizedBox(
                        height: 195,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              bigButtonWidget(
                                text: "Masuk",
                                onTap: () {
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
                              dividerWidget(),
                              circleButtonWidget(
                                onTap: () {
                                  viewModel.signInUsingGoogle!(context);
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet,',
                                    textAlign: TextAlign.center,
                                    style: interheadline6.copyWith(
                                        color: spanishGray),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/registerpage');
                                    },
                                    child: Text(
                                      'Sign Up',
                                      textAlign: TextAlign.center,
                                      style: interheadline6.copyWith(
                                          color: cyanProcess),
                                    ),
                                  )
                                ],
                              ),
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
