import 'dart:async';
import 'dart:convert';

import 'package:dart_application_1/12_14/assignment1_movie/movie_detail.dart';
import 'package:dart_application_1/12_14/assignment1_movie/movie_response.dart';
import 'package:http/http.dart' as http;

class MovieInfoService {
  Future<MovieResponse?> getMovieInfoAll({String? uri}) async {
    final http.Response response = await http.get(Uri.parse(uri ??
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&age=1'));

    return MovieResponse.fromJson(jsonDecode(response.body));
  }

  void printResponseAsJson(MovieResponse? movieResponse) =>
      movieResponse == null
          ? print('no data')
          : print(jsonEncode(movieResponse.toMap()));

  Future<MovieDetail?> getMovieInfo({required int movieId}) async {
    final http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieId}?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));
    if (response.statusCode != 200) return null;
    return MovieDetail.fromJson(jsonDecode(response.body));
  }

  void printMovieDetailAsJson(MovieDetail? movieDetail) => movieDetail == null
      ? print('no data')
      : print(jsonEncode(movieDetail.toMap()));
}

void main() async {
  MovieInfoService().printResponseAsJson(
      await MovieInfoService().getMovieInfoAll()); // 연습문제 1 json 형식으로 출력하기

  print('----------------------');

  MovieInfoService().printMovieDetailAsJson(await MovieInfoService()
      .getMovieInfo(movieId: 901362)); // 연습문제 2 json 형식으로 출력하기
}
