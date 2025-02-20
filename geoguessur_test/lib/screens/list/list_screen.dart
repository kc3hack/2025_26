import 'package:flutter/material.dart';
import 'package:geoguessur_test/screens/list/search_page.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //context.go('/setting');
            //context.push('/search');
            showDialog(context: context, builder: (context) => SearchPage());
          },
          //child: const Text('Go To Setting Screen'),
          child: const Text('検索する'),
        ),
      ),
    );
  }
}
