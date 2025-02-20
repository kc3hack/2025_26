import 'package:flutter/material.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/button/search_page.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go(
                '/list/resultTags?regionTagsStr=&categoryTagsStr=&eraTagsStr=',
              );
            },
            child: Text('data'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: KeyWordSearch(),
          ),
        ],
      ),
    );
  }
}
