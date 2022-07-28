part of 'redux.dart';

class AuthState {
  String? name;
  String? email;
  String? password;
  bool? isOffline;
  StreamSubscription? internetconnection;

  FirebaseAuth? currentUser;

  AuthState({
    this.name,
    this.email,
    this.password,
    this.isOffline,
  });

  AuthState.initialState() {
    name = '';
    email = '';
    password = '';

    isOffline = true;

    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        isOffline = true;
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        isOffline = false;
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        isOffline = false;
      }
    });
  }

  AuthState copyWith({
    String? name,
    String? email,
    String? password,
    bool? isOffline,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
