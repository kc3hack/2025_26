import 'package:flutter/material.dart';
import 'package:geoguessur_test/utils/get_location.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.level});
  final int level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("quiz level $level")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final location = await getCurrentPosition();
              context.go('./result', extra: location);
            } catch (e) {
              // エラー処理
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error: $e')));
            }
          },
          child: const Text('Go To Home'),
        ),
      ),
    );
  }
}
