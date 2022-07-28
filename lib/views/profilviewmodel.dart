part of 'views.dart';

class ProfilViewModel {
  void Function(BuildContext)? logout;

  String Function()? namaShorted;
  String Function()? emailShorted;
  String? photoUrl;

  ProfilViewModel({
    this.logout,
    this.namaShorted,
    this.emailShorted,
    this.photoUrl,
  });

  factory ProfilViewModel.create(Store<AppState> store) {
    _logout(BuildContext context) {
      FireAuthHelper.logout().whenComplete(
        () => Navigator.pushReplacementNamed(context, '/loadingpage'),
      );

      store.dispatch(ResetIndexBottomNavbarAction());
      store.dispatch(ClearPlayerAction());
    }

    _namaShorted() {
      String _nama = PlayerHelper.player!.name!;
      var _split = _nama.split("");

      String _newNama = "";

      if (_split.isNotEmpty) {
        if (_split.length > 16) {
          for (var i = 0; i < 16; i++) {
            _newNama += _split[i];
          }
          _newNama += " ...";
        } else {
          _newNama = _nama;
        }
      }

      return _newNama;
    }

    _emailShorted() {
      String _nama = PlayerHelper.player!.email!;
      var _split = _nama.split("");

      String _newNama = "";

      if (_split.isNotEmpty) {
        if (_split.length > 19) {
          for (var i = 0; i < 19; i++) {
            _newNama += _split[i];
          }
          _newNama += " ...";
        } else {
          _newNama = _nama;
        }
      }

      return _newNama;
    }

    String? _photoUrl = PlayerHelper.player!.photo;

    return ProfilViewModel(
      logout: _logout,
      namaShorted: _namaShorted,
      emailShorted: _emailShorted,
      photoUrl: _photoUrl,
    );
  }
}
