import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(Index());
}

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyStudy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  get onPressed => null;  //todo: 跳转设置页面

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTitleBar(),
      bottomNavigationBar: _buildTabBar(),
      backgroundColor: Color(0xFFF8F4ED),
    );
  }

  Stack _buildTitleBar() {
    return Stack(
      children: [
        _selectedIndex == 0 ? _buildHomePageView() : _buildFavoritesPageView(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Color(0xFF93B5CF).withOpacity(0.5),
                child: AppBar(
                  title: Text('OnlyStudy'),
                  actions: [
                    IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.settings),
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _buildTabBar() {
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
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xe5000000),
      onTap: _onTapped,
      backgroundColor: Color(0xFF93B5CF),
    );
  }

  Widget _buildHomePageView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11), // To avoid overlap with the AppBar
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 90,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    'TODO: 封面',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '第 ${index + 1} 个：标题名',
                      style: TextStyle(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '第 ${index + 1} 个：描述',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('TODO: Up主', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Spacer(),
                        Icon(Icons.visibility, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('TODO: 观看时长', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildFavoritesPageView() {
    return Center(
      child: Text('暂未进行开发'),
    );
  }
}
