import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/button/search_page.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/screens/list/result_tag_search.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  List<Place> get eventData =>
      ResultTagSearch.places
          .where((place) => place.eventDescription.isNotEmpty)
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
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
              //Text('イベント情報など\n続報をお楽しみにお待ちください', textAlign: TextAlign.center),
              Text('開催中のイベント一覧', style: TextStyle(fontSize: 18)),
              Divider(height: 30), //仮
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
                                  '${eventData[index].name}/${eventData[index].name}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              // 画像
                              Gap(12),
                              SizedBox(
                                height: 200, // 高さを固定
                                child: Image.network(
                                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYBgOvqjTc8PUtCpUDcdvBo8qlOlLyyNTDKnZa6soYE79R2M45afo37bITHXjY-vPSYet_9Zs7RmzEDp2u3YR_Xc7BOEfsm17dmX43vYXQukOr1aVWhRpuFoInSQslOMyuFhCA4TRNKJ4E/s800/dondoyaki_yaku.png',
                                  fit: BoxFit.contain, // アスペクト比を維持して表示
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
                                  //context.push('')  詳細情報へ
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
            child: KeyWordSearch(),
          ),
        ],
      ),
    );
  }
}
