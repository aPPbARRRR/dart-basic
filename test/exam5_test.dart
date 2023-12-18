import 'package:dart_application_1/12_18/exam5/post.dart';
import 'package:dart_application_1/12_18/exam5/post_manager.dart';
import 'package:dart_application_1/12_18/exam5/post_memory_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  // FileRepository 사용한 PostManagers는 다음과 같은 작동을 하거나 값을 반환한다고 가정하겠습니다.
  // addPost -> 입력받은 post를 파일로 저장함.
  // delePost, updatePost -> file로 저장된 post의 id 값을 비교하여 일치하는 post file을 삭제합니다.
  // getPosts -> file로 저장된 모든 post를 List<Post>에 담아 반환합니다. 중복 등의 요소는 고려하지 않았습니다.

  PostMeMoryRepositoryImpl postRepoImpl = PostMeMoryRepositoryImpl();
  PostManager manager = PostManager(postRepoImpl);
  Post dummyPost1 = Post(id: 1, contents: 'post 1');
  Post dummyPost2 = Post(id: 2, contents: 'post 2');
  Post dummyPost3 = Post(id: 3, contents: 'post 3');

  test('add post 정상작동합니다.', () {
    manager.addPost(dummyPost1);
    expect(postRepoImpl.dummyPosts, {dummyPost1});
    manager.addPost(dummyPost2);
    expect(postRepoImpl.dummyPosts, {dummyPost1, dummyPost2});
    manager.addPost(dummyPost3);
    expect(postRepoImpl.dummyPosts, {dummyPost1, dummyPost2, dummyPost3});
  });

  test('delete post 정상작동합니다.', () {
    postRepoImpl.dummyPosts = {dummyPost1, dummyPost2, dummyPost3};
    manager.deletePost(dummyPost2);
    expect(postRepoImpl.dummyPosts, {dummyPost3, dummyPost1});
  });

  test('update post 정상작동합니다.', () {
    postRepoImpl.dummyPosts = {dummyPost1, dummyPost2, dummyPost3};
    manager.updatePost(dummyPost2, '수정된 내용');
    expect(postRepoImpl.dummyPosts.where((e) => e.id == 2).first.contents,
        '수정된 내용');
  });

  test('get post 정상작동합니다.', () async {
    postRepoImpl.dummyPosts = {dummyPost1, dummyPost2, dummyPost3};
    expect((await manager.getPosts()).toSet(),
        {dummyPost1, dummyPost2, dummyPost3});
  });
}
