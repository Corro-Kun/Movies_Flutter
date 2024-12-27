class DetailMovie {
  int id;
  String title;
  String original_title;
  String overview;
  String poster_path;
  String backdrop_path;
  String release_date;
  double vote_average;
  bool isFavorite = false;

  DetailMovie({
    required this.id,
    required this.title,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.backdrop_path,
    required this.release_date,
    required this.vote_average,
    this.isFavorite = false,
  });

  factory DetailMovie.fromJson(Map<String, dynamic> json) {
    return DetailMovie(
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

  DetailMovie copyWith({
    int? id,
    String? title,
    String? original_title,
    String? overview,
    String? poster_path,
    String? backdrop_path,
    String? release_date,
    double? vote_average,
    bool? isFavorite,
  }) {
    return DetailMovie(
      id: id ?? this.id,
      title: title ?? this.title,
      original_title: original_title ?? this.original_title,
      overview: overview ?? this.overview,
      poster_path: poster_path ?? this.poster_path,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      release_date: release_date ?? this.release_date,
      vote_average: vote_average ?? this.vote_average,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
