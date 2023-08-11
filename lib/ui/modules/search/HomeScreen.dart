import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../api/OMBDservice.dart';
import '../../../core/MoviesDataList.dart';
import '../../../core/style_guide/movies_colors.dart';
import '../../../core/style_guide/movies_font_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MoviesDataList> movies = [];
  List<TVShowsDataList> TVshow = [];

  get logger => null;

  @override
  void initState() {
    super.initState();
    fetchMovies();
    fetchTVShows();
  }

  void fetchMovies() async {
    try {
      List<MoviesDataList> fetchedMovies =
          await MovieListScreen.getPopularMovieList();
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  void fetchTVShows() async {
    try {
      List<TVShowsDataList> fetchedTVShows =
          await MovieListScreen.getPopularSeriesList();
      setState(() {
        TVshow = fetchedTVShows;
      });
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Inicio.',
              style: MoviesTextStyle.head1(color: MoviesColors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              'Top 20 Peliculas Populares:',
              style: MoviesTextStyle.head3(color: MoviesColors.primaryYellow),
            ),
          ),
          SizedBox(
            height: 415, // Set the height you want for the ListView
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = movies[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 210,
                      height: 315,
                      decoration: BoxDecoration(
                        color: MoviesColors.blackMuted,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(movie.poster),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    LimitedBox(
                      maxHeight: 60,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        width: 220,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child:  Text(
                            movie.title,
                            style: MoviesTextStyle.subtitle1(
                                color: MoviesColors.white),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 12, right: 6),
                          child: Text(
                            movie.rating.toString(),
                            style: MoviesTextStyle.head4(
                                color: MoviesColors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RatingBar.builder(
                            initialRating: movie.rating / 2,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: MoviesColors.primaryGray,
                            glowColor: MoviesColors.primaryYellow,
                            glow: true,
                            ignoreGestures: true,
                            glowRadius: 0.1,
                            itemSize: 24,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: MoviesColors.primaryYellow,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 0, bottom: 12),
            child: Text(
              'Top 20 Series Populares:',
              style: MoviesTextStyle.head3(color: MoviesColors.primaryYellow),
            ),
          ),
          SizedBox(
            height: 415, // Set the height you want for the ListView
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: TVshow.length,
              itemBuilder: (BuildContext context, int index) {
                final tvshow = TVshow[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 210,
                      height: 315,
                      decoration: BoxDecoration(
                        color: MoviesColors.blackMuted,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(tvshow.poster),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    LimitedBox(
                      maxHeight: 60,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          width: 220,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child:  Text(
                              tvshow.name,
                              style: MoviesTextStyle.subtitle1(
                                  color: MoviesColors.white),
                              textAlign: TextAlign.start,
                            ),
                          )
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 12, right: 6),
                          child: Text(
                            tvshow.rating.toString(),
                            style: MoviesTextStyle.head4(
                                color: MoviesColors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RatingBar.builder(
                            initialRating: tvshow.rating / 2,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: MoviesColors.primaryGray,
                            glowColor: MoviesColors.primaryYellow,
                            glow: true,
                            ignoreGestures: true,
                            glowRadius: 0.1,
                            itemSize: 24,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: MoviesColors.primaryYellow,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
