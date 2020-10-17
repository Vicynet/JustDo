import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_do/db/databaseHelper.dart';
import 'package:just_do/screens/taskpage.dart';
import 'package:just_do/scrollBehaviour.dart';
import 'package:just_do/todoCardWidget.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String newDate = DateFormat.yMMMMEEEEd().format(DateTime.now());
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 24.0,
                    top: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      Text(
                        '$newDate',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getTask(),
                    builder: (context, snapshot) {
                      return ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TaskPage(
                                                task: snapshot.data[index])))
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                              child: TodoCardWidget(
                                title: snapshot.data[index].title,
                                description: snapshot.data[index].description,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskPage(task: null)),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 24.0,
                  ),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF7349FE), Color(0xFF643FDB)],
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0)),

                    // color: Color(0xFF7349FE),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset('assets/images/add_icon.png'),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
