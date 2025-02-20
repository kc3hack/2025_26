import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/interface/place.dart';

class ResultTagSearch extends StatelessWidget {
  const ResultTagSearch({
    super.key,
    required this.regionTagsStr,
    required this.categoryTagsStr,
    required this.eraTagsStr,
  });

  final String regionTagsStr;
  final String categoryTagsStr;
  final String eraTagsStr;

  List<String> get regionTags => regionTagsStr.split(',');
  List<String> get categoryTags => categoryTagsStr.split(',');
  List<String> get eraTags => eraTagsStr.split(',');

  //仮データ
  static List<Place> places = [
    Place(
      id: 000,
      name: '東大寺',
      address: '奈良県奈良市雑司町406-1',
      category: '寺',
      year: '',
    ),
    Place(
      id: 001,
      name: '清水寺',
      address: '京都府京都市東山区清水1丁目294',
      category: '寺',
      year: '',
    ),
    Place(
      id: 002,
      name: '伊勢神宮',
      address: '三重県伊勢市宇治館町1番地',
      category: '神社',
      year: '',
    ),
  ];

  Iterable<Place> get resultPlaces => places.where(
    (place) =>
        (regionTags.any((tag) => place.address.contains(tag)) ||
            regionTags.isEmpty) &&
        (categoryTags.any((tag) => place.category.contains(tag)) ||
            categoryTags.isEmpty) &&
        (eraTags.any((tag) => place.year.contains(tag)) || eraTags.isEmpty),
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
                    Gap(80), //仮
                    Text(
                      //全データ数と検索結果のデータ数が同じなら，すべてを表示する
                      '${resultPlaces.length == places.length ? 'すべて' : '${regionTags.join(' ')} ${categoryTags.join(' ')} ${eraTags.join(' ')} '}の検索結果',
                      style: TextStyle(fontSize: 14),
                    ),
                    Gap(10),
                  ],
                ),
              ),
              //Text('Result : ${resultPlaces.map((place) => place.name).toString()}'),
              Divider(),
              //リスト作成
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

//リスト作成ウィジェット
class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key, required this.resultPlaces});

  final Iterable<Place> resultPlaces;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultPlaces.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    resultPlaces.elementAt(index).name,
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
