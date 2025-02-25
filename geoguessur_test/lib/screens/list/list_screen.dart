import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/component/header/header.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  SortBy sortBy = SortBy.id;

  List<Place> places = [];

  List<Place> get eventData =>
      places.where((place) => place.eventDescription.isNotEmpty).toList();

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
        sortedPlaces.sort(
          (a, b) => sortUp ? a.id.compareTo(b.id) : b.id.compareTo(a.id),
        );
        return sortedPlaces;
      case SortBy.year:
        sortedPlaces.sort(
          (a, b) =>
              sortUp ? a.year.compareTo(b.year) : b.year.compareTo(a.year),
        );
        return sortedPlaces;
      case SortBy.popularity:
        sortedPlaces.sort(
          (a, b) =>
              sortUp
                  ? a.popularity.compareTo(b.popularity)
                  : b.popularity.compareTo(a.popularity),
        );
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: Header(),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Gap(75),
                Text(
                  'Infomation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Divider(height: 30),
                Text('イベント一覧', style: TextStyle(fontSize: 18)),
                Divider(height: 30), //仮
                eventData.isEmpty
                    ? Text(
                      'イベント情報など\n続報をお楽しみにお待ちください',
                      textAlign: TextAlign.center,
                    )
                    : SizedBox(),
                Expanded(
                  child: ListView.builder(
                    itemCount: eventData.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                // イベント名/場所
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${eventData[index].eventName}/${eventData[index].name}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                // 画像
                                Gap(12),
                                SizedBox(
                                  height: 200, // 高さを固定
                                  child: Image.network(
                                    eventData[index].eventImageUrl,
                                    fit: BoxFit.contain, // アスペクト比を維持して表示
                                    loadingBuilder: (
                                      BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress,
                                    ) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: Text('イメージを読み込み中...'),
                                        );
                                      }
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error, color: Colors.red),
                                          Text(
                                            'イメージがありません',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                // 説明
                                Gap(5),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    eventData[index].eventDescription,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                //詳細ボタン
                                GestureDetector(
                                  onTap: () {
                                    print(eventData[index].name);
                                    context.push('/detail', extra: eventData[index]);  //詳細情報へ
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "詳細はこちら",
                                        style: TextStyle(
                                          fontSize: 11,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Icon(Icons.arrow_right, size: 17),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: KeyWordSearch(onSort: onSort, sortBy: sortBy),
            ),
          ],
        ),
        ),
    );
    }
}
