part of 'helpers.dart';

class PlayerHelper {
  static Player? player = Player.fromJson({
    "uid": "",
    "name": "",
    "email": "",
    "photo": "",
    "unitAchived": [
      {"id": "1", "level": "1", "stageAchieved": []}
    ]
  });

  static Future<bool> playerChecker() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    User? _curUser = FirebaseAuth.instance.currentUser;
    GoogleSignInAccount? _googleUser;

    bool _everLogin = false;

    var _usersCollection = _firestore.collection("Players");

    var _querySnapshot = await _usersCollection.get();

    for (var _queryDocSnapshot in _querySnapshot.docs) {
      Map<String, dynamic>? _data = _queryDocSnapshot.data();

      Player _userApp = Player.fromJson(_data);

      if (_userApp.uid == _googleUser?.id || _userApp.uid == _curUser?.uid) {
        _everLogin = true;
      }
    }
    return _everLogin;
  }

  static Future addPlayer() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    User? _curUser = FirebaseAuth.instance.currentUser;

    DocumentReference _documentReferencer =
        _firestore.collection("Players").doc(_curUser!.uid);

    List<Unit> _unit = GameHelper.game.unit!;
    List<UnitAchived> _unitAchived = [];

    for (var i = 0; i < _unit.length; i++) {
      _unitAchived.add(
        UnitAchived(
          id: _unit[i].id,
          level: _unit[i].level,
          stageAchieved: [],
        ),
      );
    }

    Map<String, dynamic> _data = Player(
      uid: _curUser.uid,
      name: _curUser.displayName,
      email: _curUser.email,
      photo: _curUser.photoURL,
      unitAchived: _unitAchived,
    ).toJson();

    _documentReferencer.set(_data).whenComplete(() => print("Player Added"));
  }

  static Future<Player?> fetchPlayer() async {
    try {
      User? _curUser = FirebaseAuth.instance.currentUser;

      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      var _usersCollection = _firestore.collection("Players");

      var _querySnapshot = await _usersCollection.doc(_curUser?.uid).get();

      Map<String, dynamic>? _data = _querySnapshot.data();

      player = Player.fromJson(_data!);

      print("Hasil Fetch : " + player!.uid.toString());
    } catch (e) {
      print("Fetch Error : " + e.toString());
    }
    return player;
  }

  static Future addResult({
    List<UnitAchived>? unitAchived,
    StageAchieved? stageAchieved,
    Stage? positionStage,
    Unit? positionUnit,
  }) async {
    try {
      User? _curUser = FirebaseAuth.instance.currentUser;

      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      Player _tempPlayer = player!;

      bool _notFoundUnit = true;
      bool _notFoundStage = true;

      var _usersCollection =
          _firestore.collection("Players").doc(_curUser!.uid);

      for (var i = 0; i < _tempPlayer.unitAchived!.length; i++) {
        if (positionUnit!.id == _tempPlayer.unitAchived![i].id) {
          for (var a = 0;
              a < _tempPlayer.unitAchived![i].stageAchieved!.length;
              a++) {
            if (_tempPlayer.unitAchived![i].stageAchieved![a].id ==
                positionStage!.id) {
              _tempPlayer.unitAchived![i].stageAchieved![a] = stageAchieved!;
              _notFoundStage = false;
            }
          }

          if (_notFoundStage == true) {
            _tempPlayer.unitAchived![i].stageAchieved!.add(stageAchieved!);
          }
          _notFoundUnit = false;
        }
      }

      if (_notFoundUnit == true) {
        _tempPlayer.unitAchived!.add(
          UnitAchived(
            id: positionUnit!.id,
            level: positionUnit.level,
            stageAchieved: [stageAchieved!],
          ),
        );
      }

      Map<String, dynamic>? _data = _tempPlayer.toJson();

      await _usersCollection.update(_data);

      print(_data);
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getSoundUrl({
    required String position,
    required String name,
  }) async {
    FirebaseStorage _storage = FirebaseStorage.instance;

    String _path = "sounds/$position/" + name;
    var _ref = _storage.ref().child(_path);
    String _url = await _ref.getDownloadURL();

    print(_url);

    return _url;
  }
}
