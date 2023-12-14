import 'movie.dart';

class MovieResponse {
  final DateTime maximum;
  final DateTime minimum;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.maximum,
    required this.minimum,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        maximum: DateTime.parse(json['dates']['maximum']),
        minimum: DateTime.parse(json['dates']['minimum']),
        page: json['page'],
        results:
            List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );

  Map<String, dynamic> toMap() {
    return {
      'dates': {
        'maximum': maximum.toIso8601String(),
        'minimum': minimum.toIso8601String(),
      },
      'page': page,
      'results': List<dynamic>.from(results.map((x) => x.toMap())),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
