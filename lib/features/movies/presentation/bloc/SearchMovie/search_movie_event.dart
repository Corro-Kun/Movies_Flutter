abstract class SearchMovieEvent {}

class SearchMovieEventSearch extends SearchMovieEvent {
  final String query;

  SearchMovieEventSearch({required this.query});
}
