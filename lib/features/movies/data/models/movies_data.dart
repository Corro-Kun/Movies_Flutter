class MoviesData {
  final int id;
  final String title;
  final double vote_average;
  final String release_date;
  final String poster_path;
  final String overview;

  MoviesData({
    required this.id,
    required this.title,
    required this.vote_average,
    required this.release_date,
    required this.poster_path,
    required this.overview,
  });

  factory MoviesData.fromJson(dynamic json) {
    return MoviesData(
      id: json['id'],
      title: json['title'],
      vote_average: json['vote_average'],
      release_date: json['release_date'],
      poster_path: json['poster_path'],
      overview: json['overview'],
    );
  }
}
