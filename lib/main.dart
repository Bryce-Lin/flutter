
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
void main() => runApp(homePage());


class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return MaterialApp(
      title: '',
      home: Scaffold(
        body:SafeArea(
          child: Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
          child:SingleChildScrollView(
            child: Column(
              children:<Widget>[
                searchBar(),
                navBar(),
                bannerImage(),
                movieContainer('最新'),
                movieContainer('最新')
              ],
            ),
          )
        ),
        )
      ),
    );
  }
}


class bannerImage extends StatelessWidget {
  const bannerImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child:ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: FadeInImage.assetNetwork(
        height: 180,
        width:MediaQuery.of(context).size.width,
        fit:BoxFit.fill,
        image: 'http://tu.kanxi123.com:99/upload/vod/20200504-1/581c016dc2919e3eeb8bcd0bd498437c.jpg',
        placeholder: './images/a1.jpg',
      ),
    )  
    );
  }
}


class movieContainer extends StatelessWidget {
  final title;
  const movieContainer(this.title,{Key key}) : super(key: key);
  
  Widget getItemContainer (context) {
    return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                 child: FadeInImage.assetNetwork(
                  height: 154,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  placeholder: './images/a1.jpg',
                  image: 'https://img.sokoyo-rj.com/tuku/upload/vod/2020-03-29/202003291585461727.jpg'
              ),)
              ),
              Container(
                margin: EdgeInsets.only(top:10,bottom:5),
                child: Text('黑豹',style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff202020)
              ),),
              ),
              Text('查德维克·博斯曼',style: TextStyle(
                color: Color(0xff808080),
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),)
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
     margin:EdgeInsets.only(top:20),
     child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 4,
              height: 16,
              color: Color(0xffEA9A2F),
              margin: EdgeInsets.only(right:5),
            ),
            Text(title)
          ],
        ),
        Container(
      height: 500,
      margin: EdgeInsets.only(top:10),
      child: GridView.builder(
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
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
            return getItemContainer(context);
        })
        )
      ],
    )
    );
  }
} 

class searchBar extends StatefulWidget {
  searchBar({Key key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:BoxConstraints(
        maxHeight: 34,
      ),
      child:TextField(
        style: TextStyle(
              fontSize: 14,
              color:Color(0xff808080),
              textBaseline: TextBaseline.alphabetic, //用于提示文字对齐
            ),
      decoration: InputDecoration(
                hintText: "搜索",
                filled:true,
                isDense: true, //重要 用于编辑框对齐
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.zero,
                fillColor:Color(0xFFF6F7F8),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
            ),
    )
    ); 
  }
}


class navBar extends StatefulWidget {
  navBar({Key key}) : super(key: key);

  @override
  navBarState createState() => navBarState();
}

class navBarState extends State<navBar> {
  
  List<String> moveTitle = ['精选','电视剧','电影','动画','综艺','最近更新'];
  int selectIndex = 0;
  void _handlerTitle (i) {
     selectIndex = i;
     setState(() {});
  }

  List<Widget>  GetWidget () {
    List<Widget> childList = [];

    for(int i = 0; i< moveTitle.length;i++) {
      childList.add(
          GestureDetector(
            onTap: (){
              _handlerTitle(i);
            },
            child:Container(
              margin: i== 0? null : EdgeInsets.only(left:20),
              child:Text(
              moveTitle[i],
              style: TextStyle(
                color: selectIndex == i ? Color(0xff202020) : Color(0xff808080),
                fontSize:selectIndex == i ? 16: 14,
                fontWeight:selectIndex == i? FontWeight.bold:FontWeight.w500
              ),
            )
            )
          )
      );
    }
    return childList;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Row(
        children: GetWidget()
      ),
    );
  }
}

class imagePage extends StatelessWidget {
 
  List wigetList = [1,2,3,4,5];

  List<Widget> getWidget (BuildContext context) {
    List<Widget> aList = [];
    for(int i = 0;i<wigetList.length;i++) {
      aList.add(
        InkWell(
          child:Hero(
        tag: 'DemoTag$i',
            child: Icon(
              Icons.add,
              size: 70.0,
            ),
          ),
          onTap: () {
          //打开B路由  
          print(context);
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: HeroPage(i),
                  ),
                );
              })
          );
        }
          )
      );
          
    } 
    return aList;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉页面右上角的debug标识
      title: 'Video Demo',
      home:
      Builder(builder: (context)=>  Scaffold(
        body: Row(
            children: getWidget(context),
          )
        ),
      )
    );
    
    
  }
}

class HeroPage extends StatelessWidget {
  final int index;
  
  const HeroPage(this.index,{Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    print(index);
    return Container(
      child: Hero(
        tag: "DemoTag$index",
        child: Icon(
          Icons.add,
          size: 150.0,
        ),
      ),
    );
  }
}

// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
 ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.nmgxwhz.com:65/20200428/tOqzwhiS/index.m3u8');
    chewieController = ChewieController(
      videoPlayerController: _controller,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.black,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      aspectRatio: 3 / 2, //宽高比
      autoPlay: true, //自动播放
      looping: false, //循环播放
    );

      // ..initialize().then((_) {
      //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      //   setState(() {});
      // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: new Center(
        child: Chewie(
          controller: chewieController,
        ),
    ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
       /**
     * 当页面销毁的时候，将视频播放器也销毁
     * 否则，当页面销毁后会继续播放视频！
     */
    _controller.dispose();
    chewieController.dispose();
    // super.dispose();
  }
}


// void main() {
//   // debugPaintSizeEnabled = false; // Set to true for visual layout
//   runApp(MyApp());
// }
// class scrollViews extends StatefulWidget {
//   @override
//   scrollviewsWidget createState() => scrollviewsWidget();
// }

// class scrollviewsWidget extends State<scrollViews> {
//   ScrollController _controller =  new ScrollController();
    
//     bool isshow = false;
//     @override 
//     void initState() {
//       super.initState();

//       _controller.addListener((){
//              int offset = _controller.position.pixels.toInt();
//              print("滑动距离$offset");
//              if(offset > 900) {
//                setState(() {
//                  isshow = true;
//                });
//              }else {
//                setState(() {
//                  isshow = false;
//                });
//              }
//       });
//     }

// // ListView.builder(
// //         controller: _controller,
// //         itemCount: 200,
// //         itemBuilder: (BuildContext context,index) {
// //           return Container(
// //            padding: const EdgeInsets.all(8.0),
// //            child: Text('views in $index'),
// //           );
// //       }),

//     List<Widget> getIconList(count) {
//         List<Widget> list =  [];
//         for(int i = 0 ;i<count;i++) {
//           list.add(Container(
//             alignment: Alignment.center,
//             child:Icon(Icons.phone_android)
//           ));
//         }

//         return list;
//     }
    
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),   
//         ),
        
//         body: GridView.builder(
//         gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10.0,mainAxisSpacing: 10.0), 
//         itemBuilder: (BuildContext context,int index) {
//             return Icon(Icons.wb_incandescent);
//         },itemCount: 10,
//       ),
//       floatingActionButton: !isshow
//           ? null
//           : FloatingActionButton(
//               onPressed: () {
//                 _controller.position.jumpTo(0);
//               },
//               child: Icon(Icons.arrow_upward),
//             ),
//     );
      
     
//     }
// }

// class MyApp extends StatelessWidget {
//   static final showGrid = false; // Set to false to show ListView

//   @override
//   Widget build(BuildContext context) {
//     Color color = Theme.of(context).primaryColor;

//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: new scrollViews(),
//       );
//     }
 
//   }




//   // gridview


//   // #docregion grid
//   // Widget _buildGrid() => GridView.extent(
//   //     maxCrossAxisExtent: 150,
//   //     padding: const EdgeInsets.all(4),
//   //     mainAxisSpacing: 4,
//   //     crossAxisSpacing: 4,
//   //     children: _buildGridTileList(30));

//   // // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
//   // // The List.generate() constructor allows an easy way to create
//   // // a list when objects have a predictable naming pattern.
//   // List<Container> _buildGridTileList(int count) => List.generate(
//   //     count, (i) => Container(child: Image.asset('images/a1.jpg')));
//   // #enddocregion grid


//   // listview


//   // #docregion list
//   // Widget _buildList() => ListView(
//   //       children: [
//   //         _tile('CineArts at the Empire', '85 W Portal Aveaaa', Icons.theaters),
//   //         _tile('The Castro Theater', '429 Castro St', Icons.theaters),
//   //         _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
//   //         _tile('Roxie Theater', '3117 16th St', Icons.theaters),
//   //         _tile('United Artists Stonestown Twin', '501 Buckingham Way',
//   //             Icons.theaters),
//   //         _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
//   //         Divider(),
//   //         _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
//   //         _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
//   //         _tile(
//   //             'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
//   //         _tile('La Ciccia', '291 30th St', Icons.restaurant),
//   //         _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
//   //         _tile(
//   //             'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
//   //         _tile('La Ciccia', '291 30th St', Icons.restaurant),
//   //         _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
//   //         _tile(
//   //             'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
//   //         _tile('La Ciccia', '291 30th St', Icons.restaurant),
//   //       ],
//   //     );

//   // ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
//   //       title: Text(title,
//   //           style: TextStyle(
//   //             fontWeight: FontWeight.w500,
//   //             fontSize: 20,
//   //           )),
//   //       subtitle: Text(subtitle),
//   //       leading: Icon(
//   //         icon,
//   //         color: Colors.blue[500],
//   //       ),
//   //     );
//   // #enddocregion list

// Widget titleSection() => Container(
//   padding: const EdgeInsets.all(30),
//   child: Row(
//     children: [
//       Expanded(
//         /*1*/
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /*2*/
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 'Oeschinen Lake Campground',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       ),

//     ],
//   ),
// );

//   // Widget _buildCard() => SizedBox(
//   //   height: 250,
//   //   child: Card(
//   //     child: Column(
//   //       children: [
//   //         ListTile(
//   //           title: Text('1625 Main Street',
//   //               style: TextStyle(fontWeight: FontWeight.w500)),
//   //           subtitle: Text('My City, CA 99984'),
//   //           leading: Icon(
//   //             Icons.restaurant_menu,
//   //             color: Colors.blue[500],
//   //           ),
//   //         ),
//   //         Divider(),
//   //         ListTile(
//   //           title: Text('(408) 555-1212',
//   //               style: TextStyle(fontWeight: FontWeight.w500)),
//   //           leading: Icon(
//   //             Icons.contact_phone,
//   //             color: Colors.blue[500],
//   //           ),
//   //         ),
//   //         Divider(),
//   //         ListTile(
//   //           title: Text('costa@example.com'),
//   //           leading: Icon(
//   //             Icons.contact_mail,
//   //             color: Colors.blue[500],
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   ),
//   // );


// // class FavoriteWidget extends StatefulWidget {
// //   @override
// //   _FavoriteWidgetState createState() => _FavoriteWidgetState();
// // }
// // class _FavoriteWidgetState extends State<FavoriteWidget> {
// //   bool _isFavorited = true;
// //   int _favoriteCount = 41;

// //   void _toggleFavorite() {
// //   setState(() {
// //     if (_isFavorited) {
// //       _favoriteCount -= 1;
// //       _isFavorited = false;
// //     } else {
// //       _favoriteCount += 1;
// //       _isFavorited = true;
// //     }
// //   });
// // }
// //   // ···
// //     @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Container(
// //           padding: EdgeInsets.all(0),
// //           child: IconButton(
// //             icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
// //             color: Colors.red[500],
// //             onPressed: _toggleFavorite,
// //           ),
// //         ),
// //         SizedBox(
// //           width: 18,
// //           child: Container(
// //             child: Text('$_favoriteCount'),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }