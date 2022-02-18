import 'package:movie_app/models/models.dart';
import 'package:movie_app/utils/utils.dart';

class MovieListScreen extends StatelessWidget {
  MovieListScreen({Key? key}) : super(key: key);

  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  final _movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        desktop: _HomeScreenWeb(
          scrollController: _trackingScrollController,
          movieController: _movieController,
          ),
        mobile: _HomeScreenMobile(
          scrollController: _trackingScrollController,
          movieController: _movieController,
        ),
      ),
    );
  }
}

class _HomeScreenWeb extends StatelessWidget {
  
  final TrackingScrollController scrollController;
  final MovieController movieController;

  const _HomeScreenWeb({Key? key, required this.scrollController, required this.movieController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(color: AppColors.appPrimary,),
          child: Center(child: Text('Movie App',style: AppFont.webAppBar,)),
        ),
        MoviesCollections(
          movieController: movieController,
            title: 'Favourite Movies',
            isAllMovie: false,
        ),
        MoviesCollections(
           movieController: movieController,
            title: 'All Movies',
            isAllMovie: true,
        ),
      ],
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  final MovieController movieController;
  const _HomeScreenMobile(
      {Key? key, required this.scrollController, required this.movieController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          // ignore: deprecated_member_use
          brightness: Brightness.light,
          backgroundColor: AppColors.appPrimary,
          title: Text(
            'Movies',
            style: AppFont.mobileAppBar,
          ),
          centerTitle: true,
          floating: false,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: MoviesCollections(
            movieController: movieController,
            title: 'Favourite Movies',
            isAllMovie: false,
          ),
        ),
        SliverToBoxAdapter(
          child: MoviesCollections(
            movieController: movieController,
            title: 'All Movies',
            isAllMovie: true,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        )
      ],
    );
  }
}

class MoviesCollections extends StatelessWidget {
  const MoviesCollections({
    Key? key,
    required this.movieController,
    required this.title,
    required this.isAllMovie,
  }) : super(key: key);

  final MovieController movieController;
  final String title;
  final bool isAllMovie;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => movieController.isLoading.value
          ? Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                  child: isAllMovie
                      ? const SizedBox()
                      : const CircularProgressIndicator()),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: AppFont.listTitle,
                ),
                Responsive.isDesktop(context) ? const SizedBox(height: 10,) : const SizedBox(),
                GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 
                    Responsive.isDesktop(context) ? 1:
                    0.7,
                    // crossAxisCount: Responsive.isTablet(context) ? 3 : 2,
                    crossAxisCount: Responsive.isDesktop(context) ? 5 : Responsive.isTablet(context) ? 3 : 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: isAllMovie
                      ? movieController.allMoviesList.length
                      : movieController.favouriteMoviesList.length,
                  itemBuilder: (context, index) {
                    Movie movie = isAllMovie
                        ? movieController.allMoviesList[index]
                        : movieController.favouriteMoviesList[index];
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=> MovieDetailScreen(movie: movie));
                      },
                      child: MovieBox(
                        movie: movie,
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}


class MoviesCollectionsWeb extends StatelessWidget {
  const MoviesCollectionsWeb({
    Key? key,
    required this.movieController,
    required this.title,
    required this.isAllMovie,
  }) : super(key: key);

  final MovieController movieController;
  final String title;
  final bool isAllMovie;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => movieController.isLoading.value
          ? Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                  child: isAllMovie
                      ? const SizedBox()
                      : const CircularProgressIndicator()),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: AppFont.listTitle,
                ),
                GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: Responsive.isTablet(context) ? 3 : 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: isAllMovie
                      ? movieController.allMoviesList.length
                      : movieController.favouriteMoviesList.length,
                  itemBuilder: (context, index) {
                    Movie movie = isAllMovie
                        ? movieController.allMoviesList[index]
                        : movieController.favouriteMoviesList[index];
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=> MovieDetailScreen(movie: movie));
                      },
                      child: MovieBox(
                        movie: movie,
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}

