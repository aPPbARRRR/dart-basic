import 'package:dart_application_1/12_18/exam5/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPosts();
  Future<void> addPost(Post post);
  Future<void> deletePost(Post post);
  Future<void> updatePost(Post post, String contents);
}
