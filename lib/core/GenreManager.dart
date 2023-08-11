import 'package:flutter/material.dart';
import 'package:movies/core/style_guide/movies_colors.dart';
import 'package:movies/core/style_guide/movies_font_styles.dart';

class GenreManager extends ChangeNotifier {
  static final GenreManager _instance = GenreManager._internal();

  factory GenreManager() => _instance;

  GenreManager._internal();

  Map<int, String> genres = {
    1: 'All',
    28: 'Action',
    10759: 'Action & Adventure',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10762: 'Kids',
    10402: 'Music',
    9648: 'Mystery',
    10763: 'News',
    10764: 'Reality',
    10749: 'Romance',
    878: 'Science Fiction',
    10766: 'Soap',
    10770: 'TV Movie ',
    53: 'Thriller',
    10752: 'War',
    10768: 'War & Politics',
    37: 'Western',
  };

  Set<int> selectedGenres = {}; // Usamos un Set para garantizar unicidad

  bool isGenreSelected(int genreId) {
    return selectedGenres.contains(genreId);
  }

  bool canSelectMoreGenres() {
    return selectedGenres.length < 3; // Cambia según tus necesidades
  }

  void toggleGenre(int genreId, BuildContext context) {
    if (isGenreSelected(genreId)) {
      selectedGenres.remove(genreId);
    } else {
      if (canSelectMoreGenres()) {
        selectedGenres.add(genreId);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Solo puedes máximo seleccionar 3 categorías",
            textAlign: TextAlign.center,
            style: MoviesTextStyle.paragraphM(color: MoviesColors.white),
          ),
          duration: const Duration(seconds: 2),
        ));
      }
    }
  }
}
