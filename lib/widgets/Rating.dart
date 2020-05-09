/*
 * @Author: your name
 * @Date: 2020-05-09 11:00:00
 * @LastEditTime: 2020-05-09 11:58:38
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \videos\lib\widgets\Rating.dart
 */



import 'package:flutter/material.dart';
// import 'package:spon_rating_bar/spon_rating_widget.dart';


class RatingWidgit extends StatelessWidget {

  final double rage ;
   RatingWidgit(this.rage,{Key key}) : super(key: key);


  List<Widget> getRating() {
    List<Widget> rating = [];
    
    for(int i=0;i<5;i++) {
      rating.add(
        // #FBEBD5
          Icon(Icons.star,color:  rage / 2 <= i? Color(0xffFBEBD5):Color(0xffea9a2f),size: 14,)
      );
    }
    return rating;
  }

  String ratingValue ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: getRating()
      ),
    );
  }
}