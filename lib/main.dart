import 'package:flutter/material.dart';
import 'package:moviesappapi/MyMovieHome.dart';

void main()=>runApp(const MyMoviesApp());

class MyMoviesApp extends StatelessWidget {
  const MyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green[200],
      ),
      home: MyMovieHome(),
    );
  }
}