import 'package:movie_app/models/models.dart';
import 'package:movie_app/utils/common_import.dart';
import 'package:movie_app/utils/utils.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileMovieDetailScreen(
        movie: movie,
      ),
      desktop: MovieDetailScreenWeb(
        movie: movie,
      ),
    );
  }
}

class MovieDetailScreenWeb extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreenWeb({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgLink = movie.thumbnail.toString();
    const startIndex = 50;
    imgLink = imgLink.replaceFirst(RegExp('thumb'), 'medium', startIndex);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Image.network(
              imgLink,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(child: MovieDetailContainer(movie: movie,))
        ],
      ),
    );
  }
}

class MobileMovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MobileMovieDetailScreen({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgLink = movie.thumbnail.toString();
    const startIndex = 50;
    imgLink = imgLink.replaceFirst(RegExp('thumb'), 'medium', startIndex);
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(movie.name.toString()),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                imgLink,
                fit: BoxFit.fill,
              ),
              Responsive.isTablet(context)
                  ? const SizedBox()
                  : Positioned(
                      bottom: 0,
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, AppColors.appWhite],
                          ),
                        ),
                      ),
                    )
            ],
          ),
          MovieDetailContainer(
            movie: movie,
          ),
        ],
      ),
    );
  }
}

class MovieDetailContainer extends StatelessWidget {
  final Movie movie;
  const MovieDetailContainer({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(movie.name.toString(), style: AppFont.movieTitleLarg),
        Responsive.isDesktop(context)?const SizedBox(height: 10,):const SizedBox(),
        Text(movie.year.toString(), style: AppFont.movieYear),
        Responsive.isDesktop(context)?const SizedBox(height: 10,):const SizedBox(),
        Wrap(
          spacing: 10,
          children: movie.genres!
              .map((e) => ChoiceChip(
                    label: Text(e),
                    selected: false,
                  ))
              .toList(),
        ),
        Responsive.isDesktop(context)?const SizedBox(height: 10,):const SizedBox(),
        Text(movie.description.toString(), style: AppFont.movieDes),
        Responsive.isDesktop(context)?const SizedBox(height: 10,):const SizedBox(),
        const Divider(),
        Responsive.isDesktop(context)?const SizedBox(height: 10,):const SizedBox(),
        Text('Movie by : ${movie.director.toString()}',
            style: AppFont.highlitedName),
        const SizedBox(
          height: 10,
        ),
        Text('Star : ${movie.mainStar.toString()}',
            style: AppFont.highlitedName),
      ],
    );
  }
}
