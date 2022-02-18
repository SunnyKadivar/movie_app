import 'dart:convert';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/services/api_call.dart';
import 'package:movie_app/utils/common_import.dart';

class MovieController extends GetxController{
  var isLoading = true.obs;
  // ignore: prefer_typing_uninitialized_variables
  var favouriteMoviesList;
  // ignore: prefer_typing_uninitialized_variables
  var allMoviesList;


  @override
  void onInit() {
    super.onInit();
    fetchFavouriteMovies(); 
    fetchAllMovies();
  }

  fetchFavouriteMovies() async{
    // isLoading(true);
    await getAPI(AppConfig.apiGetFavouriteMovies, (value){
      if(value.code==200){
        var responseData = json.decode(value.response);
        var movies = responseData['data']['movies'];
        favouriteMoviesList = movies.map((model) => Movie.fromJson(model)).toList();
        // print(favouriteMoviesList[0].name);
        // isLoading(false);
      }else{
        // isLoading(false);
      }
    });
  }

  fetchAllMovies() async{
    // isLoading(true);
    await getAPI(AppConfig.apiGetAllMovies, (value){
      if(value.code==200){
        var responseData = json.decode(value.response);
        var movies = responseData['data']['movies'];
        allMoviesList = movies.map((model) => Movie.fromJson(model)).toList();
        // print(favouriteMoviesList[0].name);
        isLoading(false);
      }else{
        isLoading(false);
      }
    });
  }

}