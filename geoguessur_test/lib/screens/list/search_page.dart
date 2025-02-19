import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/button/select_tag.dart';
import 'package:geoguessur_test/screens/list/result_tag_search.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> regionTags = [];
  List<String> categoryTags = [];
  List<String> eraTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ヘッダー'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KeyWordSearch(),
              Text('地域', style: TextStyle(fontSize: 22)),
              Gap(12),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  child: SelectTag(
                    tags: ['三重', '滋賀', '京都', '大阪', '兵庫', '奈良', '和歌山'],
                    onChangeSelectTags: (tags) => regionTags = tags,
                  )),
              Gap(30),
              Text('カテゴリ', style: TextStyle(fontSize: 22)),
              Gap(12),
              Container(
                  margin: EdgeInsets.only(left: 50),
                  child: SelectTag(
                    tags: ['寺', '神社', '遺跡', '城'],
                    onChangeSelectTags: (tags) => categoryTags = tags,
                  )),
              Gap(30),
              Text('時代', style: TextStyle(fontSize: 22)),
              Gap(12),
              Container(
                  margin: EdgeInsets.only(left: 70),
                  child: SelectTag(
                    tags: ['原始', '古代', '中世', '近世', '近代', '現代'],
                    onChangeSelectTags: (tags) => eraTags = tags,
                  )),
              Gap(50),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('キャンセル')),
                ElevatedButton(
                    onPressed: () {
                      /*
                      Navigator.push(//Replacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultTagSearch(regionTags: regionTags.join(','), categoryTags: categoryTags.join(','), eraTags: eraTags.join(','),)));
                      */
                      Navigator.pop(context);
                      context.go('/list/resultTags?regionTagsStr=${regionTags.join(',')}&categoryTagsStr=${categoryTags.join(',')}&eraTagsStr=${eraTags.join(',')}');
                    },
                    child: Text('この条件で調べる'))
              ]),
            ],
          ),
        ));
  }
}
