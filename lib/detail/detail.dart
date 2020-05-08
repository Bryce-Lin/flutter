import 'package:flutter/material.dart';
class HeroPage extends StatelessWidget {
  final int index;
  
  const HeroPage(this.index,{Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    print(index);
    return Container(
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
                height: 200, 
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top:25,bottom: 33,left: 15,right: 15),
        child: Column(
          children: <Widget>[
            TopContainer()
          ],
        )
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Column(
              children: <Widget>[
                Text('复仇者联盟4：终局之战',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff202020)
                ),)
                
              ],
            )
          ],
      );
  }
}