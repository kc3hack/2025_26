import 'package:flutter/material.dart';
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
        year: ''),
    Place(
        id: 001,
        name: '清水寺',
        address: '京都府京都市東山区清水1丁目294',
        category: '寺',
        year: ''),
    Place(
        id: 002,
        name: '伊勢神宮',
        address: '三重県伊勢市宇治館町1番地',
        category: '神社',
        year: ''),
  ];

  Iterable<Place> get resultPlaces => places.where((place) =>
      (regionTags.any((tag) => place.address.contains(tag)) ||
          regionTags.isEmpty) &&
      (categoryTags.any((tag) => place.category.contains(tag)) ||
          categoryTags.isEmpty) &&
      (eraTags.any((tag) => place.year.contains(tag)) || eraTags.isEmpty));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ヘッダー'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            KeyWordSearch(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              
              child: Text(
                '${regionTags.join(' ')} ${categoryTags.join(' ')} ${eraTags.join(' ')} の検索結果',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Divider(),
            Text(
                'Result : ${resultPlaces.map((place) => place.name).toString()}')
          ],
        ),
      ),
    );
  }
}
