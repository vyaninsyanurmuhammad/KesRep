import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kesrep/helpers/helpers.dart';
import 'package:kesrep/redux/redux.dart';
import 'package:kesrep/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  store.state.onBoardingState?.initialScreen =
      await InitialScreenHelper.initialScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter KesRep',
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        routes: AppRoutes.getPages(),
        initialRoute: '/splashscreenpage',
      ),
    );
  }
}
