import 'package:flutter/material.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDiscriptionController =
      TextEditingController();

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDiscriptionController.dispose();
    super.dispose();
  }

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
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
                        width: width * 0.2,
                      ),
                      Text(
                        "Update Task",
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
                      controller: taskTitleController,
                      maxLength: 30,
                      decoration: InputDecoration(
                        hintText: "Title",
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
                      controller: taskDiscriptionController,
                      maxLines: 12,
                      decoration: InputDecoration(
                        hintText: "Discription",
                        border: myInputBorder(),
                        enabledBorder: myInputBorder(),
                        focusedBorder: myFocusBorder(),
                      ))),
              SizedBox(
                height: height * 0.15,
              ),
              Container(
                width: width * 0.9,
                height: height * 0.058,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/update');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF04809C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                  child: Text(
                    "UPDATE",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
