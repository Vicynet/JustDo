import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String todoTitle;
  final bool isDone;

  TaskWidget({this.todoTitle, this.isDone = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              border: isDone ? null : Border.all(color: Color(0xFF868290)),
              borderRadius: BorderRadius.circular(6.0),
              color: isDone ? Color(0xFF7349FE) : Colors.transparent,
            ),
            child: Image.asset('assets/images/check_icon.png'),
          ),
          SizedBox(
            width: 12.0,
          ),
          Flexible(
            child: Text(
              todoTitle ?? '(Unnamed Todo)',
              style: TextStyle(
                color: isDone ? Color(0xFF211551) : Color(0xFF868290),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
