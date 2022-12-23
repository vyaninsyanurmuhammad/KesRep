part of 'authpages.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      converter: (store) => AuthViewModel.create(store),
      onDispose: (store) {
        store.dispatch(IsLoadingAuthAction(isLoading: false));
      },
      builder: (BuildContext context, AuthViewModel viewModel) {
        return WillPopScope(
          onWillPop: () async => (viewModel.isLoading == true) ? false : true,
          child: GestureDetector(
            onTap: () {
              if (viewModel.isLoading == true) {
                viewModel.focusRegisterName?.unfocus();
                viewModel.focusRegisterEmail?.unfocus();
                viewModel.focusRegisterPassword?.unfocus();
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  Center(
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
                                'Ayo daftarkan akunmu !',
                                textAlign: TextAlign.left,
                                style:
                                    interheadline2.copyWith(color: davysGrey),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Kamu perlu mengisi nama, email dan password yang kamu punya. Jika kamu kesulitan mengisi mintalah bantuan orang disekitarmu !',
                                textAlign: TextAlign.left,
                                style:
                                    interheadline4.copyWith(color: spanishGray),
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
                                        controller:
                                            viewModel.nameRegisterController,
                                        validator: (value) =>
                                            ValidatorHelper.validateName(
                                                name: value),
                                        focusNode: viewModel.focusRegisterName,
                                        textInputAction: TextInputAction.next),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    authInputWidget(
                                      label: 'Email',
                                      controller:
                                          viewModel.emailRegisterController,
                                      validator: (value) =>
                                          ValidatorHelper.validateEmail(
                                              email: value),
                                      focusNode: viewModel.focusRegisterEmail,
                                      textInputAction: TextInputAction.next,
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
                                      focusNode:
                                          viewModel.focusRegisterPassword,
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
                                      text: "Daftar",
                                      onTap: () {
                                        ClickHelper.clickSound();

                                        if (viewModel
                                            .registerFormKey!.currentState!
                                            .validate()) {
                                          viewModel.signUpUsingEmailPassword!(
                                            context,
                                            viewModel
                                                .nameRegisterController!.text,
                                            viewModel
                                                .emailRegisterController!.text,
                                            viewModel
                                                .passwordRegisterController!
                                                .text,
                                          );

                                          viewModel.focusRegisterName
                                              ?.unfocus();
                                          viewModel.focusRegisterEmail
                                              ?.unfocus();
                                          viewModel.focusRegisterPassword
                                              ?.unfocus();

                                          viewModel.clearSignUpAction!();
                                        }
                                      },
                                      width: 200,
                                    ),
                                    const SizedBox(height: 25),
                                    (MediaQuery.of(context).viewInsets.bottom ==
                                            0.0)
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              dividerWidget(
                                                  text: "atau masuk dengan"),
                                              const SizedBox(height: 25),
                                              circleButtonWidget(
                                                onTap: () {
                                                  ClickHelper.clickSound();

                                                  viewModel.signInUsingGoogle!(
                                                      context);
                                                },
                                              ),
                                              const SizedBox(height: 25),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'kamu sudah punya akun? kamu bisa',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        interheadline6.copyWith(
                                                            color: spanishGray),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      ClickHelper.clickSound();

                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              '/loginpage');
                                                    },
                                                    child: Text(
                                                      'Login',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: interheadline6
                                                          .copyWith(
                                                              color:
                                                                  cyanProcess),
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
                  (viewModel.isLoading == true)
                      ? Container(
                          color: black.withOpacity(0.5),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: cyanProcess,
                              strokeWidth: 6,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
