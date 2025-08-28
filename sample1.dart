import 'package:demo_test/screen/mydata.dart';
import 'package:demo_test/screen/sample2.dart';
import 'package:flutter/material.dart';

class Sample1 extends StatefulWidget {
  const Sample1({super.key});

  @override
  State<Sample1> createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, i) {
            // return ListTile(
            //   title: Text("${students[i]["name"]}"),
            //   subtitle: Text("${students[i]["desc"]}"),
            //   leading: Icon(Icons.next_plan),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Sample2(ind: i)),
            //     );
            //   },
            // );
            return Card(
              child: ListTile(
                title: Text(
                  "${students[i]["name"]}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("MAJOR: ${students[i]["major"]}"),
                leading: CircleAvatar(backgroundColor: Colors.yellow),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sample2(ind: i)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
