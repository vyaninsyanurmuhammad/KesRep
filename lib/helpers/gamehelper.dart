part of 'helpers.dart';

class GameHelper {
  static final Game game = Game.fromJson({
    "unit": [
      {"id": "1", "level": "1", "stage": []},
    ]
  });

  static Future<Game> loadGame() async {
    List<String> links = [
      "assets/materi/stageOne/stageOne.json",
      "assets/materi/stageTwo/stageTwo.json",
      "assets/materi/stageTree/stageTree.json",
      "assets/materi/stageFour/stageFour.json",
      "assets/materi/stageFive/stageFive.json",
    ];

    Game _game = Game.fromJson({
      "unit": [
        {"id": "1", "level": "1", "stage": []},
      ]
    });

    List<Stage> resultList = [];

    for (var link in links) {
      String data = await rootBundle.loadString(link);

      Map<String, dynamic> result = json.decode(data);

      resultList.add(Stage.fromJson(result));
    }

    _game.unit?[0].stage?.addAll(resultList);

    return _game;
  }

  static void playSpeech({String? text = "hello world"}) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.getVoices;

    List lang = List<String>.from(await flutterTts.getLanguages);
    print(lang);
    // await flutterTts.setVoice({"name": "uk-UA-language", "locale": "uk-UA"});
    await flutterTts.setLanguage("id-ID");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text!);
  }
}
