import 'package:flutter/material.dart';


class AdvancedSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text("Namastee"),
          GestureDetector(
            child: Text("home"),
            onTap: () => Navigator.pop(context),
          )
        ],
      )
    );
  }
}
