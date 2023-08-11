import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/core/MoviesDataList.dart';

class MovieListScreen {
  static const apiKey = 'adb9a46af897b7123dd7dc8d773bdb16';

  static Future<List<MoviesDataList>> getPopularMovieList() async {
    const apiUrl = 'https://api.themoviedb.org/3/discover/movie';

    final response = await http.get(Uri.parse(
        '$apiUrl?api_key=$apiKey&sort_by=popularity.desc&language=es'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      List<MoviesDataList> fetchedMovies = results.map<MoviesDataList>((
          movieData) {
        return MoviesDataList(
            title: movieData['title'],
            posterPath: movieData['poster_path'],
            rating: (movieData['vote_average'] as num).toDouble(),
            genres: List<int>.from(movieData['genre_ids']),
            overview: movieData['overview'],
            poster: "https://image.tmdb.org/t/p/original${movieData['poster_path']}"
        );
      }).toList();

      return fetchedMovies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<TVShowsDataList>> getPopularSeriesList() async {
    const apiUrl = 'https://api.themoviedb.org/3/discover/tv';

    final response = await http.get(
        Uri.parse('$apiUrl?api_key=$apiKey&language=es'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      List<TVShowsDataList> fetchedTVshows = results.map<TVShowsDataList>((
          tvshowdata) {
        return TVShowsDataList(
            name: tvshowdata['name'],
            posterPath: tvshowdata['poster_path'],
            rating: (tvshowdata['vote_average'] as num).toDouble(),
            genres: List<int>.from(tvshowdata['genre_ids']),
            overview: tvshowdata['overview'],
            poster: "https://image.tmdb.org/t/p/original${tvshowdata['poster_path']}"
        );
      }).toList();

      return fetchedTVshows;
    } else {
      throw Exception('Failed to load tv shows');
    }
  }

  static Future<List<SearchDataList>> searchTitles({required String query}) async {
    const apiUrl = 'https://api.themoviedb.org/3/search/movie';

    final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey&query=$query'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];

      List<SearchDataList> fetchedTitleList = results.map<SearchDataList>((
          titledata) {
        return SearchDataList(
            name: titledata['name'] ?? "",
            title: titledata['title'],
            posterPath: titledata['poster_path'] != null
              ? "https://image.tmdb.org/t/p/original${titledata['poster_path']}"
              : "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"
            ,
            rating: (titledata['vote_average'] as num).toDouble(),
            genres: List<int>.from(titledata['genre_ids']),
            overview: titledata['overview'],
            releaseDate: titledata['overview']
        );
      }).toList();

      return fetchedTitleList; // Return the list after mapping
    } else {
      throw Exception(
          'Failed to load search results'); // Throw an exception in case of failure
    }
  }
}