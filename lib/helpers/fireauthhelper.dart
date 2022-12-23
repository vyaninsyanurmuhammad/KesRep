part of 'helpers.dart';

class FireAuthHelper {
  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    bool _isExist = true;

    if (user != null) {
      _isExist = await PlayerHelper.playerChecker();

      if (!_isExist) {
        PlayerHelper.addPlayer();
      }

      Future.delayed(const Duration(seconds: 5)).whenComplete(
          () => Navigator.pushReplacementNamed(context, '/homepage'));
    } else {
      Future.delayed(const Duration(seconds: 5)).whenComplete(
          () => Navigator.pushReplacementNamed(context, '/authpage'));
    }

    return firebaseApp;
  }

  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required Store<AppState> store,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      store.dispatch(IsLoadingAuthAction(isLoading: true));

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Password yang ingin kamu gunakan kurang dari 6 karakter, coba buat password yang lebih dari 6 karakter',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      } else if (e.code == 'email-already-in-use') {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Email yang ingin kamu gunakan sudah terdaftar, coba gunakan email lain yang kamu punya',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      } else if (e.code == 'invalid-email') {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Email yang ingin kamu gunakan sepertinya salah, coba periksa kembali email yang ingin kamu gunakan',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      } else {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Coba minta bantuan orang didekatmu untuk menerjemahkan masalah ini "${e.message.toString()}"',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      }
    } catch (e) {
      modalErrorAuthWidget(
          context: context,
          title: 'Kamu tidak perlu panik !',
          description:
              'Coba minta bantuan orang didekatmu untuk menerjemahkan masalah ini "${e.toString()}"',
          redButtonText: 'Dimengerti',
          onTapRed: () => Navigator.pop(context));
    }

    store.dispatch(IsLoadingAuthAction(isLoading: false));

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/loadingpage');
    }

    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required BuildContext context,
    required String email,
    required String password,
    required Store<AppState> store,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      store.dispatch(IsLoadingAuthAction(isLoading: true));

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Pastikan lagi email kamu, sepertinya email yang kamu isi salah atau belum terdaftar',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      } else if (e.code == 'wrong-password') {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Pastikan lagi password kamu, sepertinya password yang kamu isi salah',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      } else {
        modalErrorAuthWidget(
            context: context,
            title: 'Kamu tidak perlu panik !',
            description:
                'Coba minta bantuan orang didekatmu untuk menerjemahkan masalah ini "${e.message.toString()}"',
            redButtonText: 'Dimengerti',
            onTapRed: () => Navigator.pop(context));
      }
    } catch (e) {
      modalErrorAuthWidget(
          context: context,
          title: 'Kamu tidak perlu panik !',
          description:
              'Coba minta bantuan orang didekatmu untuk menerjemahkan masalah ini "${e.toString()}"',
          redButtonText: 'Dimengerti',
          onTapRed: () => Navigator.pop(context));
    }

    store.dispatch(IsLoadingAuthAction(isLoading: false));

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/loadingpage');
    }

    return user;
  }

  static Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final _googleSignIn = GoogleSignIn();

    User? user;

    final googleUser =
        await _googleSignIn.signIn().catchError((onError) => print(onError));

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credential);
    user = auth.currentUser;

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    await auth.signOut();
    await googleSignIn.signOut();
  }
}
