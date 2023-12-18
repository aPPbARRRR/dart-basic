import 'package:dart_application_1/12_18/exam5/post.dart';
import 'package:dart_application_1/12_18/exam5/post_repository.dart';

class PostFileRepositoryImpl implements PostRepository {
  // File에 저장하고 불러오는 로직을 작성하는 부분은 과제의 의도와 관련이 낮아보여 작성하지 않았습니다.

  List<Post> postList = <Post>[];

  @override
  Future<void> addPost(Post post) {
    // post를 파일로 저장합니다.
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(Post post) {
    // post 파일을 삭제합니다.
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() {
    // file로 저장된 포스트들을 리스트로 반환합니다.
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(Post post, String contents) {
    // file로 저장된 post를 수정합니다.
    // update의 경우 대상과 결과가 존재해야하므로, id 값과 일치하는 post의 내용을 수정하는 방식으로 구현하겠습니다.
    // 직접 구현한다면 post의 id등을 대조하여 일치하는 post를 수정하는 방식이 되겠습니다.
    throw UnimplementedError();
  }
}
