import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/component/header/header.dart';
import 'package:just_audio/just_audio.dart';

class GuessrScreen extends HookWidget {
  const GuessrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audioPlayer = useMemoized(() => AudioPlayer());
    final sePlayer = useMemoized(() => AudioPlayer());
    final imgLPosition = -0.3;
    final buttonMargin = 150.0;

    final Map<String, double> buttonSize = const {
      "horizontal": 100.0,
      "vertical": 40.0,
    };

    useEffect(() {
      Future.microtask(() async {
        await audioPlayer.setLoopMode(LoopMode.one);
        await audioPlayer.setAsset('assets/audio/bgm2.mp3');
        audioPlayer.setVolume(0.3);
        await audioPlayer.play();
      });

      return () {
        audioPlayer.dispose();
        sePlayer.dispose();
      };
    }, [audioPlayer, sePlayer]);

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: Header(),
          body: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  "assets/images/guessur_thumbnail.JPG",
                  fit: BoxFit.cover,
                  alignment: Alignment(imgLPosition, 0),
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                height: 70,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: const Text(
                    'いざ、推測遊戯',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontFamily: 'Tamanegi',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 1.0),
                child: Container(
                  margin: EdgeInsets.only(bottom: buttonMargin),
                  child: GestureDetector(
                    onTap: () async {
                      await sePlayer.setAsset('assets/audio/se1.mp3');
                      sePlayer.setVolume(1.0); // 音量を最大に設定
                      await sePlayer.play();
                      context.go('/guessr/level');
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: buttonSize["horizontal"]! * 1.5,
                          height: buttonSize["vertical"]! * 1.5,
                          child: Image.asset(
                            'assets/images/wood.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          '開始',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Tamanegi',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
