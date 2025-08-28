import 'package:demo_test/screen/mydata.dart';
import 'package:flutter/material.dart';

class Sample2 extends StatefulWidget {
  const Sample2({super.key, required this.ind});
  // final title;
  // final subTitle;
  final int ind;

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${students[widget.ind]["name"]}")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Container(
              height: 120,
              color: Colors.orange,
              padding: EdgeInsets.all(10),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(50),
                      child: CircleAvatar(backgroundColor: Colors.yellow),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${students[widget.ind]["name"]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Age: ${students[widget.ind]["age"]}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Grade: ${students[widget.ind]["grade"]}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Major: ${students[widget.ind]["major"]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
