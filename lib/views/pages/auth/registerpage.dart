part of 'authpages.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      converter: (store) => AuthViewModel.create(store),
      builder: (BuildContext context, AuthViewModel viewModel) {
        return GestureDetector(
          onTap: () {
            viewModel.focusRegisterName?.unfocus();
            viewModel.focusRegisterEmail?.unfocus();
            viewModel.focusRegisterPassword?.unfocus();
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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          textAlign: TextAlign.left,
                          style: interheadline4.copyWith(color: spanishGray),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: viewModel.registerFormKey,
                          child: Column(
                            children: [
                              authInputWidget(
                                label: 'Nama',
                                icon: Icons.person_outline_rounded,
                                controller: viewModel.nameRegisterController,
                                validator: (value) =>
                                    ValidatorHelper.validateName(name: value),
                                focusNode: viewModel.focusRegisterName,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              authInputWidget(
                                label: 'Email',
                                controller: viewModel.emailRegisterController,
                                validator: (value) =>
                                    ValidatorHelper.validateEmail(email: value),
                                focusNode: viewModel.focusRegisterEmail,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              authInputWidget(
                                label: 'Password',
                                icon: Icons.password,
                                controller:
                                    viewModel.passwordRegisterController,
                                validator: (value) =>
                                    ValidatorHelper.validatePassword(
                                        password: value),
                                focusNode: viewModel.focusRegisterPassword,
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
                                text: "Daftar",
                                onTap: () {
                                  if (viewModel.registerFormKey!.currentState!
                                      .validate()) {
                                    viewModel.signUpUsingEmailPassword!(
                                      context,
                                      viewModel.nameRegisterController!.text,
                                      viewModel.emailRegisterController!.text,
                                      viewModel
                                          .passwordRegisterController!.text,
                                    );

                                    viewModel.focusRegisterName?.unfocus();
                                    viewModel.focusRegisterEmail?.unfocus();
                                    viewModel.focusRegisterPassword?.unfocus();

                                    viewModel.clearSignUpAction!();
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
                                          context, '/loginpage');
                                    },
                                    child: Text(
                                      'Sign In',
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
