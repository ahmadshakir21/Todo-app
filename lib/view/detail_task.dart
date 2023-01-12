import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/database_service.dart';
import 'package:todo_app/view/update_task.dart';
import 'package:todo_app/widget/container_color.dart';

class DetailTask extends StatefulWidget {
  const DetailTask({Key? key}) : super(key: key);

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final idArgs = routeArgs['id'].toString();
    String titleArgs = routeArgs['title'].toString();
    String descriptionArgs = routeArgs['description'].toString();
    String timeArgs = routeArgs['time'].toString();
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
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                        width: width * 0.17,
                      ),
                      Text(
                        "Detail Task",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.71,
                child: ListView(
                  children: [
                    Text(
                      titleArgs,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      timeArgs,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      descriptionArgs,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: width * 0.45,
                      height: height * 0.058,
                      child: ElevatedButton(
                        onPressed: () {
                          DatabaseService.instance.delete(int.parse(idArgs));
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/delete', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFAA1945),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: Text(
                          "DELETE",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    ////////////////////////////////////////////////////////
                    Container(
                      width: width * 0.45,
                      height: height * 0.058,
                      child: ElevatedButton(
                        onPressed: () {
                          //TODO: passing data from this below route
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return UpdateTask(
                                todoModel: TodoModel(
                                    id: int.parse(idArgs),
                                    title: titleArgs,
                                    description: descriptionArgs,
                                    time: DateTime.now()),
                              );
                            },
                          ));
                          // Navigator.of(context).pushNamed('/edit', arguments: {
                          //   'id': idArgs,
                          //   'title': titleArgs,
                          //   'description': descriptionArgs,
                          //   'time': timeArgs
                          // });
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
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
