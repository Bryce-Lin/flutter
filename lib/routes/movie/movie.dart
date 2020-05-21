/*
 * @Author: your name
 * @Date: 2020-05-14 11:34:40
 * @LastEditTime: 2020-05-16 12:11:58
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \videos\lib\routes\movie\movie.js
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videos/common/apiUtil.dart';
import 'package:videos/routes/detail/detail.dart';
import 'package:videos/widgets/search.dart';

 class MoviePage extends StatefulWidget {
   MoviePage({Key key,this.type}) : super(key: key);
   final String type;
   @override
   _MoviePageState createState() => _MoviePageState();
 }
 
 class _MoviePageState extends State<MoviePage> {
    var movies;
    
     void httpGet  ()async {
    DioUtils.request('api/v2/movieHome?type='+widget.type+'&page=1&pageSize=100',method:DioUtils.GET,onSuccess:(data){
          
          var resultData = jsonDecode(data);
          movies = resultData['data'];
          setState(() { });
    });
  }


     void _jumpHome (context,name,index) {
     Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child:  HeroPage(name,movies[int.parse(index)])
                );
              })
          );
  }
  
  @override
  void initState() {
    super.initState();
    httpGet();
 
  }
     Widget getItemContainer (context,index) {
    return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Expanded(
                flex: 1,
                child:
                InkWell(
                onTap: () {
                  _jumpHome(context,'movieDemoTag'+index,index);
                },
                child: 
                Hero(
        tag: 'movieDemoTag'+index,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                 child: FadeInImage.assetNetwork(
                  height: 154,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  placeholder: './images/image.png',
                  image: movies[int.parse(index)]['vod_pic']
              ),)
          ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top:10,bottom:5),
                child: Text(movies[int.parse(index)]['vod_name'],overflow: TextOverflow.ellipsis,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff202020)
              ),),
              ),
              Text(movies[int.parse(index)]['vod_director'],overflow: TextOverflow.ellipsis,style: TextStyle(
                color: Color(0xff808080),
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),)
            ],
          );
  }

  void _searchSub (String value) {
     DioUtils.request('api/v2/movieHome/$value',method:DioUtils.GET,onSuccess:(data){
          
          var resultData = jsonDecode(data);
          movies = resultData['data'];
          setState(() { });
    });
  }

 GlobalKey _myKey = new GlobalKey();
   @override
   Widget build(BuildContext context) {
     
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
          child: ListView(
          children: <Widget>[
              searchBar(onSumbmit:_searchSub),
              Container(
                height: MediaQuery.of(context).size.height-100,
                child: movies is List ?  GridView.builder(
                  itemCount: movies.length,
                  key:_myKey,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                        crossAxisCount: 3,
                        //纵轴间距
                        mainAxisSpacing: 20.0,
                        //横轴间距
                        crossAxisSpacing: 10.0,
                        //子组件宽高长度比例
                        childAspectRatio: 0.5
                  ),
                  itemBuilder: (BuildContext context, int index) {
                      //Widget Function(BuildContext context, int index)
                      if(movies is List) {
                        return getItemContainer(context,index.toString());
                      }else {
                        return Text('');
                      }
                  }) :  Text(''),
              ),
          ],
        )
        )
      ),
    );
   }
 }


 