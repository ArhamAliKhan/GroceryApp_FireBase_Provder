import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const MySearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        onChanged: onSearch,
        style: TextStyle(color: Colors.black, fontSize: 12),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: "Search for Items here",
          hintStyle: TextStyle(color: Colors.black45),
        ),
      ),
    );
  }
}
