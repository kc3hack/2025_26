import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelTile extends StatelessWidget {
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
            leadingText,
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
            levelTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
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
            levelSubtitle,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
        onTap: () {
          context.go(route);
        },
      ),
    );
  }
}
