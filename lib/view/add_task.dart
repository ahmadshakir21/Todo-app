import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/widget/container_color.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  OutlineInputBorder myInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        borderSide: BorderSide(
          color: Color(0xFF302D52),
          width: 1.5,
        ));
  }

  OutlineInputBorder myFocusBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        borderSide: BorderSide(width: 1.5, color: Color(0xFF302D52)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List colors = [
      const Color(0xFFFFB4B4),
      const Color(0xFFBBDFC7),
      const Color(0xFFB9A7DA),
      const Color(0xFFFFDFA5)
    ];
    Random random = Random();
    int indexColor = 0;
    void changeIndexColor() {
      setState(() {
        indexColor = random.nextInt(4);
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: Color(0xFF302D52),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.205,
                      ),
                      Text(
                        "Add Task",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Container(
                  width: width * 0.9,
                  child: TextField(
                      decoration: InputDecoration(
                    border: myInputBorder(),
                    enabledBorder: myInputBorder(),
                    focusedBorder: myFocusBorder(),
                  ))),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                  width: width * 0.9,
                  child: TextField(
                      maxLines: 12,
                      decoration: InputDecoration(
                        border: myInputBorder(),
                        enabledBorder: myInputBorder(),
                        focusedBorder: myFocusBorder(),
                      ))),
              // SizedBox(
              //   height: height * 0.04,
              // ),
              // Container(
              //   height: height * 0.1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ContainerColor(
              //           color: const Color(0xFFFFB4B4), onTap: () {}),
              //       ContainerColor(
              //           color: const Color(0xFFBBDFC7), onTap: () {}),
              //       ContainerColor(
              //           color: const Color(0xFFB9A7DA), onTap: () {}),
              //       ContainerColor(
              //           color: const Color(0xFFFFDFA5), onTap: () {}),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: width * 0.9,
          height: height * 0.058,
          child: ElevatedButton(
            onPressed: () {
              // changeIndexColor();
              Navigator.pushNamed(context, '/done');
            },
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFF302D52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9))),
            child: Text(
              "DONE",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
