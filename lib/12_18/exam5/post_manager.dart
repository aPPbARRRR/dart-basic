import 'package:dart_application_1/12_18/exam5/post.dart';
import 'package:dart_application_1/12_18/exam5/post_repository.dart';

class PostManager {
  final PostRepository _postRepository;

  PostManager(this._postRepository);

  Future<void> addPost(Post post) async {
    await _postRepository.addPost(post);
  }

  Future<void> deletePost(Post post) async {
    await _postRepository.deletePost(post);
  }

  Future<void> updatePost(Post post, String contents) async {
    await _postRepository.updatePost(post, contents);
  }

  Future<List<Post>> getPosts() async {
    return await _postRepository.getPosts();
  }
}
