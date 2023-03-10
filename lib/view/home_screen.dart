import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/database_service.dart';
import 'package:todo_app/widget/container_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List colors = [
    const Color(0xFFFFB4B4),
    const Color(0xFFBBDFC7),
    const Color(0xFFB9A7DA),
    const Color(0xFFFFDFA5)
  ];

  Random random = Random();

  int indexColor = 3;

  void changeIndexColor() {
    setState(() {
      indexColor = random.nextInt(colors.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.0099,
            ),
            Container(
              height: height * 0.8,
              child: FutureBuilder<List<TodoModel>>(
                  future: DatabaseService.instance.getTodo(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TodoModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          "No Data",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF302D52)),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: const Color(0xFFAA1945)),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        return snapshot.data!.isEmpty
                            ? const Center(
                                //TODO: change this text to image
                                child: Text("No Todo in List"),
                              )
                            : ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  dynamic j = snapshot.data![index];
                                  return ContainerColor(
                                    title: j.title,
                                    description: j.description,
                                    time: DateFormat.yMMMd().format(j.time),
                                    color: colors[indexColor],
                                    onTap: () {
                                      Navigator.pushNamed(context, '/detail',
                                          arguments: {
                                            'id': j.id,
                                            'title': j.title,
                                            'description': j.description,
                                            'time': DateFormat.yMMMMEEEEd()
                                                .format(j.time),
                                          });
                                    },
                                  );
                                },
                              );
                      }
                    }
                    return const Text("");
                  }),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width * 0.9,
              height: height * 0.058,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addTask');
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF302D52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                child: Text(
                  "ADD TASK",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    ));
  }
}
