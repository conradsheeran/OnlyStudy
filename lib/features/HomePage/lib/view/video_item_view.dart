import 'package:flutter/material.dart';
import '../model/video_item_model.dart';

class VideoItemView extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<FavoritesItemModel> getItems() {
    return List.generate(20, (index) => FavoritesItemModel(
        title: '第 ${index + 1} 个：标题名',
        description: '第 ${index + 1} 个：描述',
        uploader: 'TODO: Up主',
        viewTime: 'TODO: 观看时长',
      ),
    );
  }
}
