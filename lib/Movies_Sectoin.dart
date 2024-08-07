import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moviesappapi/discription_page.dart';

class movies_section extends StatelessWidget {
  var trendingList = [];
  final bar_of_indi;
  movies_section({required this.trendingList,required this. bar_of_indi});

  // var trending_list;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Material(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.2),
              child: Text(
                bar_of_indi,
                style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,shadows:[
                      Shadow(
                        color: Colors.white,
                        blurRadius: 5.2,
                        offset: Offset(1, 1),
                      )
                    ]),
              ),
            ),
            Container(
              width: width,
              height: height * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Movie_decriptin(vote_average: trendingList[index]['vote_average'].toString(), backdrop_path: trendingList[index]['backdrop_path'], overview: trendingList[index]['overview'], poster_path: trendingList[index]['poster_path'], release_date: trendingList[index]['release_date'],)));
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: width*0.8,
                            height: height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 10.2,
                                  spreadRadius: 10.2,
                                  offset: Offset(1,1),
                                )
                              ]
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    trendingList[index]['backdrop_path'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                                trendingList[index]['title'] != null
                                    ? trendingList[index]['title']
                                    : 'loading....',
                                style: TextStyle(
                                    fontFamily: 'Schyler',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
