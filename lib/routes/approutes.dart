part of 'routes.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getPages() => {
        '/homepage': (context) => const HomePage(),
        '/ingamepage': (context) => const InGamePage(),
        '/resultpage': (context) => const ResultPage(),
        '/pembahasanpage': (context) => const PembahasanPage(),
        '/authpage': (context) => const AuthPage(),
        '/loginpage': (context) => const LoginPage(),
        '/registerpage': (context) => const RegisterPage(),
        '/loadingpage': (context) => const LoadingPage(),
        '/materidetailpage': (context) => const MateriDetailPage(),
        '/onboardingpage': (context) => const OnBoardingPage(),
        '/nointernetpage': (context) => const NoInternetPage(),
        '/splashscreenpage': (context) => const SplashScreenPage(),
        '/noticepage': (context) => const NoticePage(),
      };
}
