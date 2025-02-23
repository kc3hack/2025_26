import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/search_result_list.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';

class ResultTagSearch extends StatefulWidget {
  const ResultTagSearch({
    super.key,
    required this.regionTagsStr,
    required this.categoryTagsStr,
    required this.eraTagsStr,
  });

  final String regionTagsStr;
  final String categoryTagsStr;
  final String eraTagsStr;

  @override
  State<ResultTagSearch> createState() => _ResultTagSearchState();
}

class _ResultTagSearchState extends State<ResultTagSearch> {
  List<String> get regionTags => widget.regionTagsStr.split(',');
  SortBy sortBy = SortBy.id;

  List<Category> get categoryTags {
    return widget.categoryTagsStr
        .split(',')
        .map((category) {
          switch (category) {
            case '神社':
              return Category.shrine;
            case '寺':
              return Category.temple;
            case '遺跡':
              return Category.ruins;
            case '古墳':
              return Category.tomb;
            default:
              return null; // 未知のカテゴリは null にする
          }
        })
        .where((e) => e != null)
        .cast<Category>()
        .toList();
  }

  List<String> get eraTags => widget.eraTagsStr.split(',');

  final FirestoreService _firestoreService = FirestoreService();
  List<Place> places = [];

  // 検索
  Iterable<Place> get resultPlaces => places.where(
    (place) =>
        (regionTags.any((tag) => place.address.contains(tag)) ||
            regionTags.isEmpty) &&
        (categoryTags.any((tag) => place.category == tag) ||
            categoryTags.isEmpty) &&
        (eraTags.any((tag) => place.year.toString().contains(tag)) || eraTags.isEmpty),
  );

  //ソート
  void onSort(SortBy sortBy, bool sortUp) {
    setState(() {
      this.sortBy = sortBy;
      places = sortPlaces(sortUp);
    });
  }

  List<Place> sortPlaces(bool sortUp) {
    List<Place> sortedPlaces = places;
    switch (sortBy) {
      case SortBy.id:
        sortedPlaces.sort((a, b) => sortUp ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
        return sortedPlaces;
      case SortBy.year:
        sortedPlaces.sort((a, b) => sortUp ? a.year.compareTo(b.year) : b.year.compareTo(a.year));
        return sortedPlaces;
      case SortBy.popularity:
        sortedPlaces.sort((a, b) => sortUp ? a.popularity.compareTo(b.popularity) : b.popularity.compareTo(a.popularity));
        return sortedPlaces;
    }
  }

  //データの取得
  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  Future<void> _fetchPlaces() async {
    List<Place> fetchedPlaces = await _firestoreService.getAllPlaces();
    setState(() {
      places = fetchedPlaces;
    });
    onSort(sortBy, true);
  }
  //仮データ
  /*final List<Place> places = [
    Place(
      id: 000,
      name: '東大寺',
      address: '奈良県奈良市雑司町406-1',
      category: Category.temple,
      year: '',
      popularity: 2,
      eventDescription: 'a',
    ),
    Place(
      id: 001,
      name: '清水寺',
      address: '京都府京都市東山区清水1丁目294',
      category: Category.temple,
      year: '',
      popularity: 3,
      eventDescription: 'b',
    ),
    Place(
      id: 002,
      name: '伊勢神宮',
      address: '三重県伊勢市宇治館町1番地',
      category: Category.shrine,
      year: '',
      popularity: 1,
      eventDescription: '',
    ),
  ];*/

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
                      '${resultPlaces.length == places.length ? 'すべて' : '${regionTags.join(' ')} ${widget.categoryTagsStr.split(',').join(' ')} ${eraTags.join(' ')} '}の検索結果',
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
            child: KeyWordSearch(onSort: onSort, sortBy: sortBy),
          ),
        ],
      ),
    );
  }
}
