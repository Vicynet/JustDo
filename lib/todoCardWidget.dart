import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCardWidget extends StatelessWidget {
  final String title;
  final String description;
  TodoCardWidget({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16.0,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '(Unnamed Task)',
            style: TextStyle(
                color: Color(0xFF211551),
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            description ?? 'No description added',
            style: TextStyle(
                color: Color(0xFF86829D),
                fontSize: 14.0,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
