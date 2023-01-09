import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              color: Colors.red,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: height * 0.1,
                      color: Colors.white10,
                    ),
                  );
                },
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
              primary: const Color(0xFF302D52),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9))),
          child: Text(
            "ADD TASK",
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
