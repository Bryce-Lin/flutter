/*
 * @Author: your name
 * @Date: 2020-05-14 11:38:36
 * @LastEditTime: 2020-05-14 15:50:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \videos\lib\widgets\search.dart
 */
import 'package:flutter/material.dart';
class searchBar extends StatefulWidget {
  searchBar({Key key,this.onSumbmit}) : super(key: key);

  Function onSumbmit; //定义接收外部传进来的函数指针
  
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
        autofocus: false,
        onSubmitted:(value){
          widget.onSumbmit(value);
        },
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