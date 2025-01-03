import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homepage/view/video_item_view.dart';
import 'package:provider/provider.dart';
import 'package:homepage/main.dart';
import 'package:favorites/main.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoItemView(),
      child: Consumer<VideoItemView>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Stack(
              children: [
                viewModel.selectedIndex == 0
                    ? HomePage()
                    : FavoritesPage(),
                _buildTitleBar(context),
              ],
            ),
            bottomNavigationBar: _buildTabBar(context),
            backgroundColor: Color(0xFFF8F4ED),
          );
        },
      ),
    );
  }

  Widget _buildTitleBar(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Color(0xFF93B5CF).withOpacity(0.8),
            child: AppBar(
              title: Text('OnlyStudy'),
              actions: [
                IconButton(
                  onPressed: () {
                    // TODO: 跳转到设置页面
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final viewModel = Provider.of<VideoItemView>(context, listen: false);
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '主页',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: '收藏夹',
        ),
      ],
      currentIndex: viewModel.selectedIndex,
      selectedItemColor: Color(0xe5000000),
      onTap: viewModel.setIndex,
      backgroundColor: Color(0xFF93B5CF),
    );
  }
}
