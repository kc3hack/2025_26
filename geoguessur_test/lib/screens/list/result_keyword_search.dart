import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/search_result_list.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/screens/list/result_tag_search.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';

class ResultKeywordSearch extends StatefulWidget {
  const ResultKeywordSearch({super.key, required this.searchWords});

  final String searchWords;

  @override
  State<ResultKeywordSearch> createState() => _ResultKeywordSearchState();
}

class _ResultKeywordSearchState extends State<ResultKeywordSearch> {
  List<String> get words => widget.searchWords.split(',');
  SortBy sortBy = SortBy.id;

  final FirestoreService _firestoreService = FirestoreService();
  List<Place> places = [];

  //データのアクセス先を変更すること
  Iterable<Place> get resultPlaces => places.where(
    (place) => words.every((word) => place.getAll.contains(word)),
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
      case SortBy.name:
        sortedPlaces.sort((a, b) => sortUp ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
        return sortedPlaces;
      case SortBy.popularity:
        sortedPlaces.sort((a, b) => sortUp ? b.popularity.compareTo(a.popularity) : a.popularity.compareTo(b.popularity));
        return sortedPlaces;
    }
  }

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
            child: KeyWordSearch(onSort: onSort, sortBy: sortBy, ),
          ),
        ],
      ),
    );
  }
}
