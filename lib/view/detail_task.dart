import 'package:flutter/material.dart';

class DetailTask extends StatelessWidget {
  const DetailTask({Key? key}) : super(key: key);

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
                      const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                        color: Color(0xFF302D52),
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
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          width: width * 0.9,
          height: height * 0.058,
          child: ElevatedButton(
            onPressed: () {},
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
