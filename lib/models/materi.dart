part of 'models.dart';

class Materi {
  List<Konten>? konten;

  Materi({this.konten});

  Materi.fromJson(Map<String, dynamic> json) {
    if (json['konten'] != null) {
      konten = <Konten>[];
      json['konten'].forEach((v) {
        konten!.add(Konten.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (konten != null) {
      data['konten'] = konten!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Konten {
  String? title;
  String? description;
  String? image;

  Konten({this.title, this.description, this.image});

  Konten.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
