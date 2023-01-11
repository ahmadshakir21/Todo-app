import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/database_service.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key, required this.todoModel}) : super(key: key);

  final TodoModel todoModel;

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController? taskTitleController;
  TextEditingController? taskDiscriptionController;

  String? title;
  String? description;
  DateTime? time;

  @override
  void initState() {
    taskTitleController = TextEditingController(text: widget.todoModel.title);
    taskDiscriptionController =
        TextEditingController(text: widget.todoModel.description);
    super.initState();
  }

  updateTask(TodoModel todoModel) async {
    await DatabaseService.instance.update(todoModel);
  }

  @override
  void dispose() {
    taskTitleController!.dispose();
    taskDiscriptionController!.dispose();
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
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // final idArgs = routeArgs['id'].toString();
    // String titleArgs = routeArgs['title'].toString();
    // String descriptionArgs = routeArgs['description'].toString();
    // String timeArgs = routeArgs['time'].toString();

    // title = titleArgs;
    // description = descriptionArgs;
    // time = DateTime.parse(timeArgs);

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
                        width: width * 0.155,
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
                      // maxLength: 30,
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
                    setState(() {
                      title = taskTitleController!.text;
                      description = taskDiscriptionController!.text;
                      time = DateTime.now();
                    });
                    TodoModel todoModel = TodoModel(
                        id: widget.todoModel.id,
                        title: title!,
                        description: description!,
                        time: DateTime.now());
                    updateTask(todoModel);

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/update', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF04809C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                  child: Text(
                    "SAVE",
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
