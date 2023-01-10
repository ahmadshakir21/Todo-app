import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/database_service.dart';
import 'package:todo_app/widget/container_color.dart';

class DetailTask extends StatelessWidget {
  const DetailTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final titleArgs = routeArgs['title'].toString();
    final descriptionArgs = routeArgs['description'].toString();
    final timeArgs = routeArgs['time'].toString();
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
                        width: width * 0.2,
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
                height: height * 0.04,
              ),
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
        floatingActionButton: Container(
          width: width * 0.9,
          height: height * 0.058,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/delete');
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
