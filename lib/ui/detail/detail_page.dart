import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/ui/detail/detail_view_model.dart';
import 'package:flutter_firebase_blog_app/ui/write/widgets/write_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  DetailPage(this.post);

  Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(DetailViewModelProvider(post));

    return Scaffold(
      appBar: AppBar(
        actions: [
          iconButton(Icons.delete, () async {
            print('삭제 아이콘 터치됨');
            final vm = ref.read(DetailViewModelProvider(post).notifier);
            final result = await vm.deletePost();
            if (result) {
              Navigator.pop(context);
            }
          }),
          iconButton(Icons.edit, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WritePage(post);
                },
              ),
            );
          }),
        ],
        title: Text('DetailPage'),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 500),
        children: [
          Image.network(
            state.imageUrl,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  state.writer,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                // Text(
                //   '2024.12.02 10:26',
                //   style: TextStyle(fontWeight: FontWeight.w200),
                // ),
                SizedBox(height: 14),
                Text(
                  state.content,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}
