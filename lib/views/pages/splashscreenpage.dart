part of 'pages.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).whenComplete(
        () => Navigator.pushReplacementNamed(context, '/loadingpage'));
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: silver, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "Icon",
                style: interheadline3.copyWith(color: davysGrey),
              ),
            )),
      ),
    );
  }
}
