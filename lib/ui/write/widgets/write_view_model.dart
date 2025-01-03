// 1. 상태 클래스 만들기
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WriteState {
  bool isWriting;
  WriteState(this.isWriting);
}

// 2. 뷰모델 만들기
class WriteViewModel extends AutoDisposeFamilyNotifier<WriteState, Post?> {
  @override
  WriteState build(Post? arg) {
    return WriteState(false);
  }

  Future<bool> insert({
    required String writer,
    required String title,
    required String content,
  }) async {
    final postRepository = PostRepository();

    //통신이 일어나기 전에 로딩뷰 확인을 위한 상태확인
    state = WriteState(true);
    //포스트 객체가 null이면 : 새로작성
    if (arg == null) {
      final result = await postRepository.insert(
        title: title,
        content: content,
        writer: writer,
        imageUrl: 'https://picsum.photos/200/300',
      );
      await Future.delayed(Duration(milliseconds: 500));
      state = WriteState(false);
      return result;
    }
    //null이 아니면 : 수정
    else {
      final result = await postRepository.update(
        id: arg!.id,
        writer: writer,
        title: title,
        content: content,
        imageUrl: 'https://picsum.photos/200/300',
      );
      await Future.delayed(Duration(milliseconds: 500));
      state = WriteState(false);
      return result;
    }
  }
}

// 3. 뷰모델 관리자 만들기
final writeViewModelProvider =
    NotifierProvider.autoDispose.family<WriteViewModel, WriteState, Post?>(() {
  return WriteViewModel();
});
