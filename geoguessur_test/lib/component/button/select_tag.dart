import 'package:flutter/material.dart';

class SelectTag extends StatefulWidget {
  const SelectTag({super.key, required this.tags, required this.onChangeSelectTags});
  final List<String> tags;
  final ValueChanged<List<String>> onChangeSelectTags;

  @override
  _SelectTagState createState() => _SelectTagState();
}

class _SelectTagState extends State<SelectTag> {
  /// 選択されたタグ
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 16,
      spacing: 16,
      children: widget.tags.map((tag) {
        final isSelected = selectedTags.contains(tag);

        return InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedTags.remove(tag);
              } else {
                selectedTags.add(tag);
              }
              widget.onChangeSelectTags(selectedTags);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),  //遅延
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: Color(0xFFE1DEE4)),
              color: isSelected ? Color(0xFF65558F) : Colors.white,
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF1D1B20),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
