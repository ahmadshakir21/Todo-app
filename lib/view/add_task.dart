import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/database_service.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDiscriptionController =
      TextEditingController();

  String? title;
  String? description;
  DateTime? time;

  addNote(TodoModel todoModel) async {
    await DatabaseService.instance.insertTodo(todoModel);
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDiscriptionController.dispose();
    super.dispose();
  }

  Future insert() async {
    await DatabaseService.instance.insertTodo(TodoModel(
        title: taskTitleController.text.trim(),
        description: taskDiscriptionController.text.trim(),
        time: DateTime.now()));
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
                      controller: taskTitleController,
                      // maxLength: 25,
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
                        hintText: "Description",
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
                    setState(() {
                      title = taskTitleController.text;
                      description = taskDiscriptionController.text;
                      time = DateTime.now();
                    });
                    TodoModel todoModel = TodoModel(
                        title: title!, description: description!, time: time!);

                    addNote(todoModel);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/done", (route) => false);
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
