import 'dart:ui';

import 'package:movie_app/models/models.dart';
import 'package:movie_app/utils/common_import.dart';

class MovieBox extends StatelessWidget {
  final Movie movie;
  const MovieBox({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: double.infinity,
            child: SizedBox(
              height: 170,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(movie.thumbnail.toString(), fit: BoxFit.cover),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Image.network(
                          movie.thumbnail.toString(),
                          scale: 0.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.8),
            decoration: BoxDecoration(
              color: AppColors.appPrimary.withOpacity(0.2),
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.name.toString(),
                  style: AppFont.movieTitle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.year.toString(),
                  style: AppFont.movieYear,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
