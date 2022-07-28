part of 'views.dart';

class AuthViewModel {
  final bool? isOffline;
  final GlobalKey<FormState>? loginFormKey;
  final GlobalKey<FormState>? registerFormKey;

  final TextEditingController? emailLoginController;
  final TextEditingController? passwordLoginController;

  final TextEditingController? emailRegisterController;
  final TextEditingController? passwordRegisterController;
  final TextEditingController? nameRegisterController;

  final FocusNode? focusLoginEmail;
  final FocusNode? focusLoginPassword;

  final FocusNode? focusRegisterName;
  final FocusNode? focusRegisterEmail;
  final FocusNode? focusRegisterPassword;

  void Function(BuildContext, String, String)? signInUsingEmailPassword;
  void Function()? clearSignInAction;

  void Function(BuildContext, String, String, String)? signUpUsingEmailPassword;
  void Function()? clearSignUpAction;

  void Function(BuildContext)? signInUsingGoogle;

  AuthViewModel({
    this.isOffline,
    this.loginFormKey,
    this.registerFormKey,
    this.emailLoginController,
    this.passwordLoginController,
    this.signInUsingEmailPassword,
    this.emailRegisterController,
    this.passwordRegisterController,
    this.nameRegisterController,
    this.focusLoginEmail,
    this.focusLoginPassword,
    this.focusRegisterName,
    this.focusRegisterEmail,
    this.focusRegisterPassword,
    this.clearSignInAction,
    this.signUpUsingEmailPassword,
    this.clearSignUpAction,
    this.signInUsingGoogle,
  });

  factory AuthViewModel.create(Store<AppState> store) {
    final GlobalKey<FormState>? _loginFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState>? _registerFormKey = GlobalKey<FormState>();

    final TextEditingController? _emailLController = TextEditingController();
    final TextEditingController? _passwordLoginController =
        TextEditingController();

    final TextEditingController? _emailRegisterController =
        TextEditingController();
    final TextEditingController? _passwordRegisterController =
        TextEditingController();
    final TextEditingController? _nameRegisterController =
        TextEditingController();

    final FocusNode? _focusLoginEmail = FocusNode();
    final FocusNode? _focusLoginPassword = FocusNode();

    final FocusNode? _focusRegisterName = FocusNode();
    final FocusNode? _focusRegisterEmail = FocusNode();
    final FocusNode? _focusRegisterPassword = FocusNode();

    _signInUsingEmailPassword(
      BuildContext context,
      String email,
      String password,
    ) {
      FireAuthHelper.signInUsingEmailPassword(
        context: context,
        email: email,
        password: password,
      );

      store.dispatch(
        SignInAction(email: email, password: password),
      );
    }

    _clearSignInAction() {
      store.dispatch(ClearSignInAction());
    }

    _signUpUsingEmailPassword(
      BuildContext context,
      String name,
      String email,
      String password,
    ) {
      FireAuthHelper.registerUsingEmailPassword(
        context: context,
        name: name,
        email: email,
        password: password,
      );

      store.dispatch(
        SignUpAction(
          name: name,
          email: email,
          password: password,
        ),
      );
    }

    _clearSignUpAction() {
      store.dispatch(ClearSignUpAction());
    }

    _signInUsingGoogle(BuildContext context) {
      FireAuthHelper.signInWithGoogle().whenComplete(
          () => Navigator.pushReplacementNamed(context, '/loadingpage'));
    }

    return AuthViewModel(
      isOffline: store.state.authState?.isOffline,
      loginFormKey: _loginFormKey,
      registerFormKey: _registerFormKey,
      emailLoginController: _emailLController,
      passwordLoginController: _passwordLoginController,
      signInUsingEmailPassword: _signInUsingEmailPassword,
      clearSignInAction: _clearSignInAction,
      nameRegisterController: _nameRegisterController,
      emailRegisterController: _emailRegisterController,
      passwordRegisterController: _passwordRegisterController,
      focusLoginEmail: _focusLoginEmail,
      focusLoginPassword: _focusLoginPassword,
      focusRegisterName: _focusRegisterName,
      focusRegisterEmail: _focusRegisterEmail,
      focusRegisterPassword: _focusRegisterPassword,
      signUpUsingEmailPassword: _signUpUsingEmailPassword,
      clearSignUpAction: _clearSignUpAction,
      signInUsingGoogle: _signInUsingGoogle,
    );
  }
}
