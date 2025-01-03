import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/video_item_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<VideoItemView>(context, listen: false);
    final items = model.getItems();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      // Only the list portion, no title bar
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 58),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Center(
                        child: Text(
                          'TODO: 封面',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.description,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.person, size: 16, color: Colors.grey),
                              const SizedBox(width: 5),
                              Text(
                                item.uploader,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const Spacer(),
                              const Icon(Icons.visibility, size: 16, color: Colors.grey),
                              const SizedBox(width: 5),
                              Text(
                                item.viewTime,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}