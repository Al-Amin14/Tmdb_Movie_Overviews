import 'package:flutter/material.dart';

class Movie_decriptin extends StatelessWidget {
  var backdrop_path;
  var overview;
  var poster_path;
  var release_date;
  var vote_average;
  Movie_decriptin({super.key,required this.backdrop_path,required this.overview,required this.poster_path,required this.release_date,required this.vote_average});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network('https://image.tmdb.org/t/p/w500'+backdrop_path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    left: 10,
                    child: Text(
                      '🌟 Average Ratting '+vote_average,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 243, 243)),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'title',
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'release date:- '+release_date,
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: width * 0.5,
                    height: height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pink,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+poster_path),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      overview,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
