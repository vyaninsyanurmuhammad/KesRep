part of 'helpers.dart';

class ClickHelper {
  static void clickSound() async {
    final _player = AudioPlayer();

    await _player.setVolume(0.7);

    await _player.play(AssetSource('clicknormal.wav'));
  }
}
