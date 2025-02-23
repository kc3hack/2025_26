import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geoguessur_test/component/button/keyword_search.dart';
import 'package:geoguessur_test/component/button/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:geoguessur_test/component/header/header.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: Header(),
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  Gap(75),
                  Text('Infomation',style: TextStyle(fontSize: 18),),
                  Divider(height: 30,),
                  Text('イベント情報など\n続報をお楽しみにお待ちください',textAlign: TextAlign.center,)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: KeyWordSearch(),
              ),
            ],
          ),
        )
      ),
      );
    }
}
