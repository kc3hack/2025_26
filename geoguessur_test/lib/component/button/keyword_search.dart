import 'package:flutter/material.dart';

//キーワード検索フィールド（仮）

class KeyWordSearch extends StatelessWidget {
  const KeyWordSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: 'キーワード検索'),
    );
  }
}
