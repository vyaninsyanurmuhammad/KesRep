part of 'pages.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      onInit: (store) async {
        if (store.state.authState?.isOffline == true) {
          Future.delayed(const Duration(seconds: 1)).whenComplete(
            () => Navigator.pushNamedAndRemoveUntil(
                context, '/nointernetpage', (route) => false),
          );
        } else {
          await FireAuthHelper.initializeFirebase(context: context);
          store.state.authState?.currentUser = FirebaseAuth.instance;
        }
      },
      converter: (store) => AuthViewModel.create(store),
      onDispose: (store) {},
      builder: (BuildContext context, AuthViewModel viewModel) {
        return Scaffold(
          backgroundColor: white,
          body: const Center(
            child: SizedBox(
              width: 250,
              child: RiveAnimation.asset(
                "assets/loadingscreen.riv",
                artboard: "Ambulance",
                animations: ["loop"],
              ),
            ),
          ),
        );
      },
    );
  }
}
