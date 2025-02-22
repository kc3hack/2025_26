import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/search_result_list.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/screens/list/result_tag_search.dart';

class ResultKeywordSearch extends StatelessWidget {
  const ResultKeywordSearch({super.key, required this.searchWords});

  final String searchWords;

  List<String> get words => searchWords.split(',');

  //データのアクセス先を変更すること
  Iterable<Place> get resultPlaces => ResultTagSearch.places.where(
    (place) => words.every((word) => place.getAll.contains(word)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ヘッダー')),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Gap(80),
                    Text(
                      '"${words.join(' ')}" に当てはまる場所が${resultPlaces.length}件見つかりました',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    Gap(10),
                  ],
                ),
              ),
              Divider(),
              SearchResultList(resultPlaces: resultPlaces),
            ],
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
