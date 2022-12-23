part of 'models.dart';

class Player {
  String? uid;
  String? name;
  String? email;
  String? photo;
  List<UnitAchived>? unitAchived;

  Player({this.uid, this.name, this.email, this.photo, this.unitAchived});

  Player.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    if (json['unitAchived'] != null) {
      unitAchived = <UnitAchived>[];
      json['unitAchived'].forEach((v) {
        unitAchived!.add(UnitAchived.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['photo'] = photo;
    if (unitAchived != null) {
      data['unitAchived'] = unitAchived!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnitAchived {
  String? id;
  String? level;
  List<StageAchieved>? stageAchieved;

  UnitAchived({this.id, this.level, this.stageAchieved});

  UnitAchived.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    if (json['stageAchieved'] != null) {
      stageAchieved = <StageAchieved>[];
      json['stageAchieved'].forEach((v) {
        stageAchieved!.add(StageAchieved.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    if (stageAchieved != null) {
      data['stageAchieved'] = stageAchieved!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StageAchieved {
  String? id;
  String? level;
  bool? isPlayed;
  String? medalAchieved;
  List<int>? scores;

  StageAchieved(
      {this.id, this.level, this.isPlayed, this.medalAchieved, this.scores});

  StageAchieved.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    isPlayed = json['isPlayed'];
    medalAchieved = json['medalAchieved'];
    scores = json['scores'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['isPlayed'] = isPlayed;
    data['medalAchieved'] = medalAchieved;
    data['scores'] = scores;
    return data;
  }
}
