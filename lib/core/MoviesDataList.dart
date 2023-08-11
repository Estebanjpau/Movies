
class MoviesDataList {
  final String title;
  final String posterPath;
  final double rating;
  final List<int> genres;
  final String overview;
  final String poster;

  MoviesDataList({
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.poster,
  });
}

class TVShowsDataList {
  final String name;
  final String posterPath;
  final double rating;
  final List<int> genres;
  final String overview;
  final String poster;

  TVShowsDataList({
    required this.name,
    required this.posterPath,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.poster,
  });
}

class SearchDataList {
  final String name;
  final String title;
  final String posterPath;
  final double rating;
  final List<int> genres;
  final String overview;
  final String releaseDate;

  SearchDataList({
    required this.name,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.releaseDate,
  });
}