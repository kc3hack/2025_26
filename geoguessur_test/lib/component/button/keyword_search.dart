import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/search_page.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:go_router/go_router.dart';

/*
  検索バー
    ├ キーワード検索
    ├ ソートボタン
    └ タグ検索
  ラジオボタン
*/
class KeyWordSearch extends StatefulWidget {
  const KeyWordSearch({super.key, required this.onSort, required this.sortBy});
  final Function(SortBy, bool) onSort;
  final SortBy sortBy;

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
                            return SortListSheet(
                              onSort: widget.onSort,
                              sortBy: widget.sortBy,
                            );
                          },
                        );
                        widget.onSort(widget.sortBy,true);
                      },
                      icon: Icon(Icons.sort),
                    ),
                  ],
                ),
              ),
              //タグ
              AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15),
                duration: Duration(milliseconds: 550),
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
                  duration: const Duration(milliseconds: 130),
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
  const SortListSheet({super.key, required this.onSort, required this.sortBy});
  final Function(SortBy, bool) onSort;
  final SortBy sortBy;

  @override
  State<SortListSheet> createState() => _SortListSheetState();
}

enum SortBy { id, name, popularity }

class _SortListSheetState extends State<SortListSheet> {
  SortBy _sortBy = SortBy.id;
  bool sortUp = true; //昇順:降順

  @override
  void initState() {
    super.initState();
    _sortBy = widget.sortBy;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('並び替え', style: TextStyle(fontSize: 23))],
                ),
                //Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sortUp = !sortUp;
                          widget.onSort(widget.sortBy, sortUp);
                        });
                      },
                      child: Row(
                        children: [
                          AnimatedRotation(
                            turns: sortUp ? 0 : 0.5, // 0度（昇順）⇄ 180度（降順）
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            sortUp ? '昇順' : '降順',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RadioListTile(
                title: Text('デフォルト'),
                value: SortBy.id,
                groupValue: _sortBy,
                onChanged: (value) {
                  setState(() {
                    widget.onSort(value!, sortUp);
                    _sortBy = value;
                  });
                },
              ),
              RadioListTile(
                title: Text('名前順'),
                value: SortBy.name,
                groupValue: _sortBy,
                onChanged: (value) {
                  setState(() {
                    widget.onSort(value!, sortUp);
                    _sortBy = value;
                  });
                },
              ),
              RadioListTile(
                title: Text('知名度順'),
                value: SortBy.popularity,
                groupValue: _sortBy,
                onChanged: (value) {
                  setState(() {
                    widget.onSort(value!, sortUp);
                    _sortBy = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
  child: Row(
    children: [
      if (sortUp) ...[
        Icon(Icons.arrow_upward, color: Colors.grey.shade800),
        Text('昇順', style: TextStyle(fontSize: 14)),
      ] else ...[
        Icon(Icons.arrow_downward, color: Colors.grey.shade800),
        Text('降順', style: TextStyle(fontSize: 14)),
      ],
    ],
  ),
*/
