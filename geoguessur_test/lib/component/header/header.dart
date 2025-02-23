import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/list');
              break;
            case 2:
              context.go('/guessr');
              break;
          }
        },
        tabs: [Tab(text: "Main"), Tab(text: "Info"), Tab(text: "Guessr")],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 0); // AppBar + TabBar の高さ
}
