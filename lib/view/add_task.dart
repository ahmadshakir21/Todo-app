import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

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
                      const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                        color: Color(0xFF302D52),
                      ),
                      SizedBox(
                        width: width * 0.245,
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
              SizedBox(
                height: height * 0.05,
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: 4,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       height: 100,
              //       width: 100,
              //     );
              //   },
              // ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: width * 0.9,
          height: height * 0.058,
          child: ElevatedButton(
            onPressed: () {},
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
