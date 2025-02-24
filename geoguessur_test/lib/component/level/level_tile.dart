import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class LevelTile extends StatefulWidget {
  final String leadingText;
  final String levelTitle;
  final String levelSubtitle;
  final String route;

  const LevelTile({
    Key? key,
    required this.leadingText,
    required this.levelTitle,
    required this.levelSubtitle,
    required this.route,
  }) : super(key: key);

  @override
  _LevelTileState createState() => _LevelTileState();
}

class _LevelTileState extends State<LevelTile> {
  late AudioPlayer _sePlayer;
  @override
  void initState() {
    super.initState();
    _sePlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Container(
          width: 110, // 幅を固定
          height: 100, // 高さを固定
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wood.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            widget.leadingText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/washi.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            widget.levelTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontFamily: 'Tamanegi',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/washi.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            widget.levelSubtitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Tamanegi',
            ),
          ),
        ),
        onTap: () async {
          await _sePlayer.setAsset('assets/audio/se2.mp3');
          _sePlayer.setVolume(1.0);
          await _sePlayer.play();
          context.go(widget.route);
        },
      ),
    );
  }
}
