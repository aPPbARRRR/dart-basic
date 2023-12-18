import 'package:dart_application_1/12_18/exam5/post.dart';
import 'package:dart_application_1/12_18/exam5/post_repository.dart';

class PostMeMoryRepositoryImpl implements PostRepository {
  Set<Post> dummyPosts = <Post>{};

  @override
  Future<void> addPost(Post post) async => dummyPosts.add(post);

  @override
  Future<void> deletePost(Post post) async =>
      dummyPosts.removeWhere((e) => e.id == post.id);

  @override
  Future<List<Post>> getPosts() async => dummyPosts.toList();

  @override
  Future<void> updatePost(Post post, String contents) async =>
      dummyPosts.where((e) => e.id == post.id).first.contents = contents;
}
