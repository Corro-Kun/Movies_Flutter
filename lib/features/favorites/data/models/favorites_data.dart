class FavoritesData {
  int id;
  String title;
  String original_title;
  String overview;
  String poster_path;
  String backdrop_path;
  String release_date;
  double vote_average;

  FavoritesData({
    required this.id,
    required this.title,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.backdrop_path,
    required this.release_date,
    required this.vote_average,
  });

  factory FavoritesData.fromJson(Map<String, dynamic> json) {
    return FavoritesData(
      id: json['id'],
      title: json['title'],
      original_title: json['original_title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      backdrop_path: json['backdrop_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'].toDouble(),
    );
  }

  factory FavoritesData.fromMap(Map<String, dynamic> map) {
    return FavoritesData(
      id: map['id'],
      title: map['title'],
      original_title: map['original_title'],
      overview: map['overview'],
      poster_path: map['poster_path'],
      backdrop_path: map['backdrop_path'],
      release_date: map['release_date'],
      vote_average: map['vote_average'],
    );
  }
}
