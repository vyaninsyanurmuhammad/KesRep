part of 'models.dart';

class Game {
  List<Unit>? unit;

  Game({this.unit});

  Game.fromJson(Map<String, dynamic> json) {
    if (json['unit'] != null) {
      unit = <Unit>[];
      json['unit'].forEach((v) {
        unit!.add(Unit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (unit != null) {
      data['unit'] = unit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Unit {
  String? id;
  String? level;
  List<Stage>? stage;

  Unit({this.id, this.level, this.stage});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    if (json['stage'] != null) {
      stage = <Stage>[];
      json['stage'].forEach((v) {
        stage!.add(Stage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    if (stage != null) {
      data['stage'] = stage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stage {
  String? id;
  String? level;
  int? medalRequred;
  String? title;
  String? gambar;
  List<Quiz>? quiz;

  Stage(
      {this.id,
      this.level,
      this.medalRequred,
      this.title,
      this.gambar,
      this.quiz});

  Stage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    medalRequred = json['medalRequred'];
    title = json['title'];
    gambar = json['gambar'];
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['medalRequred'] = medalRequred;
    data['title'] = title;
    data['gambar'] = gambar;
    if (quiz != null) {
      data['quiz'] = quiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quiz {
  String? id;
  String? tipe;
  String? gambar;
  String? pertanyaan;
  Penjelasan? penjelasan;
  List<Pilihan>? pilihan;

  Quiz(
      {this.id,
      this.tipe,
      this.gambar,
      this.pertanyaan,
      this.penjelasan,
      this.pilihan});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipe = json['tipe'];
    gambar = json['gambar'];
    pertanyaan = json['pertanyaan'];
    penjelasan = json['penjelasan'] != null
        ? Penjelasan.fromJson(json['penjelasan'])
        : null;
    if (json['pilihan'] != null) {
      pilihan = <Pilihan>[];
      json['pilihan'].forEach((v) {
        pilihan!.add(Pilihan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tipe'] = tipe;
    data['gambar'] = gambar;
    data['pertanyaan'] = pertanyaan;
    if (penjelasan != null) {
      data['penjelasan'] = penjelasan!.toJson();
    }
    if (pilihan != null) {
      data['pilihan'] = pilihan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Penjelasan {
  String? gambar;
  String? deskripsi;

  Penjelasan({this.gambar, this.deskripsi});

  Penjelasan.fromJson(Map<String, dynamic> json) {
    gambar = json['gambar'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gambar'] = gambar;
    data['deskripsi'] = deskripsi;
    return data;
  }
}

class Pilihan {
  bool? isRight;
  String? data;

  Pilihan({this.isRight, this.data});

  Pilihan.fromJson(Map<String, dynamic> json) {
    isRight = json['isRight'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isRight'] = isRight;
    data['data'] = this.data;
    return data;
  }
}
