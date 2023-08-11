import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';
import 'package:movies/api/OMBDservice.dart';
import 'package:movies/core/style_guide/movies_colors.dart';
import 'package:movies/core/style_guide/movies_font_styles.dart';
import 'package:movies/ui/Components/HomeGenreChips.dart';

import '../../../core/GenreManager.dart';
import '../../../core/MoviesDataList.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GenreManager _genreManager = GenreManager();
  var logger = Logger();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<SearchDataList> searchData = [];

  bool _genreExpanded = false;

  void searchQuery() async {
    try {
      List<SearchDataList> fetchedTitle =
          await MovieListScreen.searchTitles(query: _searchQuery);
      setState(() {
        searchData = fetchedTitle;
      });
      print(searchData);
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(top: 24, left: 24, bottom: 24),
              child: Text(
                'Busqueda.',
                style: MoviesTextStyle.head1(color: MoviesColors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 80,
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  label: const Text("Buscar"),
                  labelStyle: MoviesTextStyle.subtitle1(
                    color: MoviesColors.primaryGray,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: MoviesColors.white,
                  filled: true,
                  fillColor: MoviesColors.mutedGray,
                ),
                style: MoviesTextStyle.subtitle1(color: MoviesColors.white),
                keyboardType: TextInputType.text,
                cursorColor: MoviesColors.primaryYellow,
                maxLength: 25,
              ),
            ),
            GenreChipsWidget(
              genreManager: _genreManager,
              isExpanded: _genreExpanded,
              onGenreToggle: (int genreId) {
                setState(() {
                  _genreManager.toggleGenre(genreId, context);
                });
              },
            ),
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Resultados de busqueda",
                    style: MoviesTextStyle.subtitle1(color: MoviesColors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _genreExpanded = !_genreExpanded;
                      });
                    },
                    child: Icon(
                      (_genreExpanded
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                      size: 30,
                      color: MoviesColors.primaryYellow,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 420,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                scrollDirection: Axis.vertical,
                itemCount: searchData.length,
                itemBuilder: (BuildContext context, int index) {
                  final searchdata = searchData[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 147,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: MoviesColors.blackMuted,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(searchdata.posterPath),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 220,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            const EdgeInsets.only(bottom: 4),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Text(
                                            searchdata.title,
                                            style: MoviesTextStyle.head4(
                                                color: MoviesColors.white),
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            searchdata.rating
                                                .toString()
                                                .substring(0, 3),
                                            style: MoviesTextStyle.head4(
                                                color: MoviesColors.white),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: RatingBar.builder(
                                            initialRating:
                                                searchdata.rating / 2,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            unratedColor:
                                                MoviesColors.primaryGray,
                                            glowColor:
                                                MoviesColors.primaryYellow,
                                            glow: true,
                                            ignoreGestures: true,
                                            glowRadius: 0.1,
                                            itemSize: 24,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: MoviesColors.primaryYellow,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: SingleChildScrollView(
                                        child: Text(
                                          searchdata.overview,
                                          style: MoviesTextStyle.paragraphM(
                                              color: MoviesColors.gray),
                                        )))

                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 24,
          left: 24,
          right: 24,
          child: ElevatedButton(
            onPressed: searchQuery,
            style:
                ElevatedButton.styleFrom(primary: MoviesColors.primaryYellow),
            child: SizedBox(
                height: 48,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Buscar",
                      textAlign: TextAlign.center,
                      style: MoviesTextStyle.head3(color: MoviesColors.black),
                    ))),
          ),
        ),
      ],
    );
  }
}
