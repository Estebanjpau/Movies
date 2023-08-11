import 'package:flutter/material.dart';

import '../../core/GenreManager.dart';
import '../../core/style_guide/movies_colors.dart';
import '../../core/style_guide/movies_font_styles.dart';

class GenreChipsWidget extends StatelessWidget {
  final GenreManager genreManager;
  final bool isExpanded;
  final Function(int) onGenreToggle;

  const GenreChipsWidget({
    required this.genreManager,
    required this.isExpanded,
    required this.onGenreToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded ? null : 50,
      child: isExpanded
          ? Wrap(
              spacing: 6.0,
              children: genreManager.genres.entries.map((entry) {
                int genreId = entry.key;
                String genreName = entry.value;

                return FilterChip(
                  label: Text(genreName),
                  padding: const EdgeInsets.all(6),
                  shadowColor: MoviesColors.primaryYellow,
                  selectedShadowColor: MoviesColors.white,
                  surfaceTintColor: Colors.blue,
                  labelStyle: MoviesTextStyle.label(color: MoviesColors.white),
                  backgroundColor: MoviesColors.mutedGray,
                  selectedColor: MoviesColors.primaryYellow,
                  selected: genreManager.isGenreSelected(genreId),
                  onSelected: (isSelected) {
                    onGenreToggle(genreId);
                    // Aquí puedes aplicar el filtro según los géneros seleccionados
                    // y actualizar la lista de películas mostradas
                  },
                );
              }).toList(),
            )
          : ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Wrap(
                  spacing: 6.0,
                  children: genreManager.genres.entries.map((entry) {
                    int genreId = entry.key;
                    String genreName = entry.value;

                    return FilterChip(
                      label: Text(genreName),
                      padding: const EdgeInsets.all(6),
                      shadowColor: MoviesColors.primaryYellow,
                      selectedShadowColor: MoviesColors.white,
                      surfaceTintColor: Colors.blue,
                      labelStyle:
                          MoviesTextStyle.label(color: MoviesColors.white),
                      backgroundColor: MoviesColors.mutedGray,
                      selectedColor: MoviesColors.primaryYellow,
                      selected: genreManager.isGenreSelected(genreId),
                      onSelected: (isSelected) {
                        onGenreToggle(genreId);
                        // Aquí puedes aplicar el filtro según los géneros seleccionados
                        // y actualizar la lista de películas mostradas
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }
}
