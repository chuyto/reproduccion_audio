import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Reproducción de Audio")),
        body: AudioPlayerWidget(),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _playAudio() async {
    const audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

    await _audioPlayer.play(UrlSource(audioUrl));

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        print('Audio finished playing');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _playAudio,
        child: Text("Reproducir Audio"),
      ),
    );
  }
}

/*
Se importo la libreria en el pubspec audioplayers
 Se cambió el uso de la URL pasando un objeto `UrlSource(audioUrl)` en lugar de un `String` directamente.
Se agregó un listener para `onPlayerStateChanged` para detectar cuando el audio termina de reproducirse.
Se inicializó el `AudioPlayer` en el método `initState()` para asegurar que el reproductor esté listo antes de su uso.
*/

*/
