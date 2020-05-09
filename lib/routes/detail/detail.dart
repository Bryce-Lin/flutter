import 'package:flutter/material.dart';
import 'package:videos/models/index.dart';
// import 'package:videos/models/Movi.dart';
import 'package:videos/widgets/Rating.dart';
class HeroPage extends StatelessWidget {
  final int index;
  
  const HeroPage(this.index,{Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
    return  Container(
      child: Hero(
        tag: "DemoTag$index",
        child:  Stack(
          overflow:Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
             FadeInImage.assetNetwork(
                    height: 280,
                    width: 500,
                    fit: BoxFit.fill,
                    placeholder: './images/a1.jpg',
                    image: 'https://bkimg.cdn.bcebos.com/pic/023b5bb5c9ea15ce9e367ff3b0003af33b87b274?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UyMjA=,xp_5,yp_5'
          ),
            Positioned(
              top: 260,
              child: Container(
                decoration: new BoxDecoration(
                //背景
                color: Colors.white,
                //设置四周圆角 角度
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width,
                // height: 500, 
                child: MovieContainer(),
                // child: wo,
              ),
            ),
            ],
          ),
      ),
    );
  }
}


class MovieContainer extends StatelessWidget {
  const MovieContainer({Key key}) : super(key: key);
  final String movieContent = '''来自泰坦星的灭霸为了解决宇宙资源匮乏、人口暴增的问题，集齐了所有无限宝石，一个响指成功地使全宇宙生命随机减半。
宇宙由于灭霸的行动而变得满目疮痍，但是五年之后，被困在量子领域的蚁人意外回到现实世界，他的出现为幸存的复仇者点燃了希望。无论前方将遭遇怎样的后果，幸存的复仇者都必须在剩余盟友的帮助下再一次集结，以逆转灭霸的所作所为，彻底恢复宇宙的秩序       
                ''';

  final String performer = '''
  范·迪塞尔 / 艾莎·冈萨雷斯 / 萨姆·修汉 / 托比·凯贝尔 / 妲露拉·莱莉 / 拉蒙尼·莫里斯 / 盖·皮尔斯 / 悉达尔斯·达南杰
  ''';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top:25,bottom: 33,left: 15,right: 15),
        child: Column(
          children: <Widget>[
            TopContainer(),
            Padding(
              padding: EdgeInsets.only(top: 15,bottom: 20),
              child: Divider(
              height: 1,
              color:Color(0xffEFEFEF)
            ),
            ),
            DesContainer(),
            movieDesContainer('影片简介',movieContent),
            movieDesContainer('演职人员',performer),
            playerButton(),
          ],
        )
    );
  }
}

class playerButton extends StatefulWidget {
  playerButton({Key key}) : super(key: key);

  @override
  _playerButtonState createState() => _playerButtonState();
}

class _playerButtonState extends State<playerButton> {
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
              color: Color(0xff202020)
            ),),
             MaterialButton(
                color: Color(0xffEFEFEF),
                minWidth: 100,
                height: 37,
                textColor: Color(0xff202020),
                child: new Text('第一集'),
                onPressed: () {
                    // ...
                },
            )
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xff202020)
          ),),
          Container(
            margin:EdgeInsets.only(top:15),
            child: Text(
                content
            ,style: TextStyle(
              fontWeight: FontWeight.w500,
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
  const TopContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('复仇者联盟4：终局之战',style: TextStyle(
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
  const DesContainer({Key key}) : super(key: key);

  List<Widget> getDesWidget () {
    List<Map<String,Object>> desList = [{'title':'上映时间'},{'title':'制片地图'},{'title':'影片时长'}];
    List<Widget> desWidgetList = [];

    for(int i =0;i<desList.length;i++) {
      desWidgetList.add(Column(
           children: <Widget>[
              Text('2019.4.24',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff202020)
              ),),
              Text(desList[i]['title'],style: TextStyle(
                fontSize: 12,
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