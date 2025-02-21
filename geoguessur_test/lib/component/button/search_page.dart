import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/button/select_tag.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.isOpen,
    required this.isText,
    required this.submit,
  });
  final ValueChanged<bool> isOpen;
  final bool isText;
  final Function submit;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> regionTags = [];
  List<String> categoryTags = [];
  List<String> eraTags = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(30),
        Text('地域', style: TextStyle(fontSize: 22)),
        Gap(12),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: SelectTag(
            tags: ['三重', '滋賀', '京都', '大阪', '兵庫', '奈良', '和歌山'],
            onChangeSelectTags: (tags) => regionTags = tags,
          ),
        ),
        Gap(30),
        Text('カテゴリ', style: TextStyle(fontSize: 22)),
        Gap(12),
        Container(
          margin: EdgeInsets.only(left: 40),
          child: SelectTag(
            tags: ['寺', '神社', '遺跡', '古墳'],
            onChangeSelectTags: (tags) => categoryTags = tags,
          ),
        ),
        Gap(30),
        Text('時代', style: TextStyle(fontSize: 22)),
        Gap(12),
        Container(
          margin: EdgeInsets.only(left: 70),
          child: SelectTag(
            tags: ['原始', '古代', '中世', '近世', '近代', '現代'],
            onChangeSelectTags: (tags) => eraTags = tags,
          ),
        ),
        Gap(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  side: BorderSide(color: Colors.black, width: 0.5),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  setState(() {
                    widget.isOpen(false);
                  });
                },
                child: Text(
                  'キャンセル',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Gap(20),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF65558F),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  side: BorderSide(color: Colors.black, width: 0.5),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  widget.isOpen(false);
                  if(widget.isText){
                    widget.submit();
                  }
                  else{
                  context.go(
                    '/list/resultTags?regionTagsStr=${regionTags.join(',')}&categoryTagsStr=${categoryTags.join(',')}&eraTagsStr=${eraTags.join(',')}',
                  );}
                },
                child: Text(
                  'この条件で調べる',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
