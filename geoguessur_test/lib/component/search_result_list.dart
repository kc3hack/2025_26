//リスト作成ウィジェット
import 'package:flutter/material.dart';
import 'package:geoguessur_test/interface/place.dart';

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