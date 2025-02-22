//リスト作成ウィジェット
import 'package:flutter/material.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:go_router/go_router.dart';

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
            GestureDetector(
              onTap: () {
                print(resultPlaces.elementAt(index).name);
                //context.push(''); 詳細情報へ
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      resultPlaces.elementAt(index).name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}