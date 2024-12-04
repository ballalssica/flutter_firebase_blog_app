// 1. 상태클래스 만들기
// post 객체 사용할거라 만들지 않음

// 2. 뷰모델 만들기
import 'dart:async';

import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewModel extends AutoDisposeFamilyNotifier<Post, Post> {
  @override
  Post build(Post arg) {
    return arg;
  }

  Future<bool> deletePost() async {
    final postRepository = PostRepository();
    return await postRepository.delete(arg.id);
  }
}

// 3. 뷰모델 관리자 만들기
final DetailViewModelProvider =
    NotifierProvider.autoDispose.family<DetailViewModel, Post, Post>(
  () {
    return DetailViewModel();
  },
);
