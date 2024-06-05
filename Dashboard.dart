import 'package:flutter/material.dart';
import 'package:flutter1/Offline%20Database/StudentModel.dart';
import 'package:flutter1/Offline%20Database/screen/editstudent.dart';
import 'package:flutter1/Offline%20Database/services.dart';

class Mydashboardsqflite extends StatefulWidget {
  const Mydashboardsqflite({super.key});

  @override
  State<Mydashboardsqflite> createState() => _MydashboardsqfliteState();
}

class _MydashboardsqfliteState extends State<Mydashboardsqflite> {
  List<StudentModel> studentList = [];

  var studentModel = StudentModel();
  var studentService = StudentService();

  @override
  void initState() {
    super.initState();
    getAllRecordFromStudent();
  }

  getAllRecordFromStudent() async {
    studentService = StudentService();
    var allStudent = await studentService.readService("Student");

    allStudent.forEach((singleStudent) {
      setState(() {
        studentModel = StudentModel();

        studentModel.id = singleStudent["id"];
        studentModel.name = singleStudent["name"];
        studentModel.subject = singleStudent["subject"];
        studentModel.marks = singleStudent["marks"];

        studentList.add(studentModel);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${studentList[index].name}"),
            subtitle: Text("${studentList[index].subject}"),
            trailing: Wrap(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyEditStudent(studentModel: studentList[index]),
                          ));
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () async {
                      print(studentList[index]);
                      var studentModel = StudentModel();
                      var studentService = StudentService();

                      studentModel.id = studentList[index].id;
                      var result = await studentService.deleteService(
                          "Student", studentModel);

                      print(result);
                      studentList = [];
                      getAllRecordFromStudent();
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
