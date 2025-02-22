import 'package:flutter/material.dart';
import 'package:geoguessur_test/component/button/search_page.dart';
import 'package:go_router/go_router.dart';

/*
  検索バー
    ├ キーワード検索
    ├ ソートボタン
    └ タグ検索
  ラジオボタン
*/
class KeyWordSearch extends StatefulWidget {
  const KeyWordSearch({super.key});

  @override
  _KeyWordSearchState createState() => _KeyWordSearchState();
}

class _KeyWordSearchState extends State<KeyWordSearch> {
  bool isOpen = false;
  bool showContent = false;
  final keywordController = TextEditingController();
  bool isText = false;

  submit() {
    if (keywordController.text != '') {
      List<String> words = keywordController.text.split(RegExp(r'\s'));
      words = words.map((word) => word.trim()).toList();
      words.removeWhere((word) => word.isEmpty);
      String searchWords = words.join(',');

      setState(() {
        isOpen = false;
        showContent = false;
      });

      ///keywordController.clear();
      context.go('/list/resultKeywords?searchWords=$searchWords');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                  color: Color(0xFFECE6F0),
                ),
                child: Row(
                  children: [
                    //検索ボタン
                    IconButton(onPressed: submit, icon: Icon(Icons.search)),
                    //検索フィールド
                    Expanded(
                      child: TextField(
                        controller: keywordController,
                        decoration: InputDecoration(
                          hintText: 'キーワード検索',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            isText = value.isNotEmpty;
                          });
                        },
                        onTap: () {
                          setState(() {
                            isOpen = true;
                          });
                        },
                        onSubmitted: (value) => submit(),
                      ),
                    ),
                    //ソートボタン
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          builder: (BuildContext context) {
                            return SortListSheet();
                          },
                        );
                      },
                      icon: Icon(Icons.sort),
                    ),
                  ],
                ),
              ),
              //タグ
              AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutQuint,
                height: isOpen ? MediaQuery.of(context).size.height * 0.67 : 0,
                onEnd: () {
                  if (isOpen) {
                    setState(() {
                      showContent = true;
                    });
                  } else {
                    keywordController.clear();
                    isText = false;
                  }
                },
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOutQuad,
                  opacity: showContent ? 1 : 0,
                  child: SearchPage(
                    isOpen: (ret) {
                      setState(() {
                        isOpen = ret;
                        showContent = ret;
                      });
                    },
                    isText: isText,
                    submit: submit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ラジオボタン
class SortListSheet extends StatefulWidget {
  const SortListSheet({super.key});

  @override
  State<SortListSheet> createState() => _SortListSheetState();
}

class _SortListSheetState extends State<SortListSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          RadioListTile(
            title: Text('あ'),
            value: null,
            groupValue: null,
            onChanged: (Null value) {},
          ),
        ],
      ),
    );
  }
}
