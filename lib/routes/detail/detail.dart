import 'package:flutter/material.dart';
import 'package:videos/routes/player/play.dart';
// import 'package:videos/models/index.dart';
// import 'package:videos/models/Movi.dart';
import 'package:videos/widgets/Rating.dart';
class HeroPage extends StatelessWidget {
  final dynamic name;
  final detail ;
  const HeroPage(this.name,this.detail,{Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
    return  MaterialApp(
      onGenerateRoute:(RouteSettings settings){
      return MaterialPageRoute(builder: (context){
            // String routeName = settings.name;
            return VideoApp(playurl:settings.arguments);
        // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
        // 引导用户登录；其它情况则正常打开路由。
      }
    );
    },
      home:Scaffold(
      body:Container(
      child: Hero(
        tag: name,
        child: ListView(
          children: <Widget>[
             FadeInImage.assetNetwork(
                    height: 280,
                    width: 500,
                    fit: BoxFit.fill,
                    placeholder: './images/image.png',
                    image: detail['vod_pic']
          ),
            Stack(
          overflow:Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
           

            Positioned(
              // top: 260,
              child: Container(
                decoration: new BoxDecoration(
                //背景
                color: Colors.white,
                //设置四周圆角 角度
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width,
                // height: 500, 
                child: MovieContainer(detail),
                // child: wo,
              ),
            ),
            ],
          ),
          ],
        )
      ),
    ) ,
    )
    );
       
  }
}


class MovieContainer extends StatelessWidget {
  final detail ;
  const MovieContainer(this.detail,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top:25,bottom: 33,left: 15,right: 15),
        child: Column(
          children: <Widget>[
            TopContainer(detail['vod_name']),
            Padding(
              padding: EdgeInsets.only(top: 15,bottom: 20),
              child: Divider(
              height: 1,
              color:Color(0xffEFEFEF)
            ),
            ),
            DesContainer(detail),
            movieDesContainer('影片简介',detail['vod_content']),
            movieDesContainer('演职人员',detail['vod_actor']),
            playerButton(detail['movieList']),
          ],
        )
    );
  }
}

class playerButton extends StatefulWidget {
  final List movieList;
  playerButton(this.movieList,{Key key}) : super(key: key);

  @override
  _playerButtonState createState() => _playerButtonState();
}

class _playerButtonState extends State<playerButton> {

  List<Widget> getPlayBtn () {
      List<Widget> playList = [];
      for(int i = 0;i<widget.movieList.length;i++) {
        playList.add(MaterialButton(
                color: Color(0xffEFEFEF),
                minWidth: 100,
                height: 37,
                textColor: Color(0xff202020),
                child: new Text(widget.movieList[i].split('\$')[0]),
                onPressed: () {
                     Navigator.of(context).pushNamed("/VideoApp",arguments: widget.movieList[i].split('\$')[1]);
                },
            ));
        
      }
      return playList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:25),
      width: MediaQuery.of(context).size.width,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
            Text('云播',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              decoration: TextDecoration.none,
              color: Color(0xff202020)
              
            ),),
            Wrap(
              alignment :WrapAlignment.spaceBetween,
              // crossAxisAlignment :WrapCrossAlignment.center,   //交叉轴上子控件的对齐方式
              spacing: 20, //主轴上子控件的间距
              runSpacing: 15, //交叉轴上子控件之间的间距
              children: getPlayBtn(), //要显示的子控件集合
            ),
             
         ],
       )
    );
  }
}

class movieDesContainer extends StatelessWidget {
  final String title ;
  final String content;
  const movieDesContainer(this.title,this.content,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:25),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            fontSize: 16,
            color: Color(0xff202020)
          ),),
          Container(
            margin:EdgeInsets.only(top:15),
            child: Text(
                content
            ,style: TextStyle(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              fontSize: 14,
              color: Color(0xff808080)
            ),),
          )
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  final String title;
  const TopContainer(this.title,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff202020)
                ),),
              Row(
                children: <Widget>[
                  RatingWidgit(double.parse('5.3')),
                  Container(
                    margin: EdgeInsets.only(left:10),
                    child:Text('5.3',style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff808080)
                  ),)
                  )
                ],
              )
              
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: ,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:3),
                  child: Icon(Icons.favorite_border,size: 28,),
                ),
                Text('12.8W',
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                  color:Color(0xff808080)
                ),
                )
              ],
            )
          ],
      );
  }
}



class DesContainer extends StatelessWidget {
  final detail ;
  const DesContainer(this.detail,{Key key}) : super(key: key);

  List<Widget> getDesWidget () {
    List<Map<String,Object>> desList = [{'title':'上映时间','val':'vod_year'},{'title':'制片地图','val':'vod_area'},{'title':'影片时长','val':'vod_total'}];
    List<Widget> desWidgetList = [];

    for(int i =0;i<desList.length;i++) {
      desWidgetList.add(Column(
           children: < Widget>[
              Text(detail[desList[i]['val']].toString(),style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff202020)
              ),),
              Text(desList[i]['title'],style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
                color: Color(0xff808080)
              ),)
           ],
        ),);
    }
    return desWidgetList;
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: getDesWidget()
    );
  }
}