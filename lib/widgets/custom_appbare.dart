import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function onTapLocation;
  final Function onTapSearch;
  CustomAppBar({this.onTapSearch,this.onTapLocation});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap :onTapLocation,
            child: Icon(
              Icons.near_me,
              color: Colors.white,
              size: 30,
            ),
          ),

          GestureDetector(
            onTap :onTapSearch,

            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
