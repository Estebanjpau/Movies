import 'package:flutter/cupertino.dart';

import '../../../core/style_guide/movies_colors.dart';
import '../../../core/style_guide/movies_font_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: AlignmentDirectional.topStart,
          padding: const EdgeInsets.only(top: 24, left: 24, bottom: 24),
          child: Text(
            'Perfil.',
            style: MoviesTextStyle.head1(color: MoviesColors.white),
          )
      ),
    ]);
  }
}