part of 'widgets.dart';

class LoadingInGameWidget extends StatelessWidget {
  const LoadingInGameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
        ),
        onWillPop: () async => false);
  }
}
