import 'package:flutter/material.dart';
import 'package:moviesappapi/trending_moivies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MyMovieHome extends StatefulWidget {
  MyMovieHome({super.key});

  @override
  State<MyMovieHome> createState() => _MyMovieHomeState();
}

class _MyMovieHomeState extends State<MyMovieHome> {
  var trending_movie = [];
  var popular_movies = [];
  var height_rated = [];
  final api_key = 'a1046462f8ae142f40d26b8129929677';
  final access_token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMTA0NjQ2MmY4YWUxNDJmNDBkMjZiODEyOTkyOTY3NyIsIm5iZiI6MTcyMjY3Mjc0Mi45NjU0NSwic3ViIjoiNjZhZGU0MWMwMGRjNTI4ZDViNjMzZjczIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.s3f-vMTTQ8uV_WeBHEG72EkcewfG1BZ_TGNw9M49x-A';

  @override
  void initState() {
    super.initState();
    loadmovie();
  }

  loadmovie() async {
    TMDB tmdbwithcontonlogs = TMDB(
      ApiKeys(api_key, access_token),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingresult = await tmdbwithcontonlogs.v3.trending.getTrending();
    Map topratting = await tmdbwithcontonlogs.v3.movies.getTopRated();
    Map popular = await tmdbwithcontonlogs.v3.movies.getPopular();
    setState(() {
      trending_movie = trendingresult['results'];
      height_rated = topratting['results'];
      popular_movies = popular['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Welcome to Movie mania',
            style: TextStyle(
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 5.2,
                    offset: Offset(1, 1),
                  ),
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: width,
                  height: height * 0.4,
                  child: movies_section(
                    trendingList: trending_movie,
                    bar_of_indi: 'Trending Movies',
                  )),
              Container(
                  width: width,
                  height: height * 0.4,
                  child: movies_section(
                    trendingList: popular_movies,
                    bar_of_indi: 'Popular Movies',
                  )),
              Container(
                  width: width,
                  height: height * 0.4,
                  child: movies_section(
                    trendingList: height_rated,
                    bar_of_indi: 'Height Rated',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
