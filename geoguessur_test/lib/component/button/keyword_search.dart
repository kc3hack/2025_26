import 'package:flutter/material.dart';
import 'package:geoguessur_test/component/button/search_page.dart';

//キーワード検索フィールド（仮）

class KeyWordSearch extends StatefulWidget {
  const KeyWordSearch({super.key});

  @override
  _KeyWordSearchState createState() => _KeyWordSearchState();
}

class _KeyWordSearchState extends State<KeyWordSearch> {
  bool isOpen = false;
  bool showContent = false;

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
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'キーワード検索',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onTap: () {
                          setState(() {
                            isOpen = true;
                          });
                        },
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
                  ],
                ),
              ),
              AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15),
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                height: isOpen ? MediaQuery.of(context).size.height * 0.65 : 0,
                child: SearchPage(
                  isOpen: (ret) {
                    setState(() {
                      isOpen = ret;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
