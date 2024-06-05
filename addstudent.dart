import "package:flutter/material.dart";
import "package:flutter1/Offline%20Database/CustomeWidget/MyTextWidget.dart";
import "package:flutter1/Offline%20Database/StudentModel.dart";
import "package:flutter1/Offline%20Database/screen/Dashboard.dart";
import "package:flutter1/Offline%20Database/services.dart";

class MyAddStudent extends StatefulWidget {
  const MyAddStudent({super.key});

  @override
  State<MyAddStudent> createState() => _MyAddStudentState();
}

class _MyAddStudentState extends State<MyAddStudent> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _subjectcontroller = TextEditingController();
  TextEditingController _markscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Add"),
      ),
      body: Column(
        children: [
          MyTextFeild(
            controller: _namecontroller,
            hint: "Enter Your Name",
            lable: "Name",
          ),
          MyTextFeild(
            controller: _subjectcontroller,
            hint: "Enter Your Subject",
            lable: "Subject",
          ),
          MyTextFeild(
            controller: _markscontroller,
            hint: "Enter Your Marks",
            lable: "Marks",
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                var studentModel = StudentModel();
                var _studentService = StudentService();

                studentModel.name = _namecontroller.text.toString();
                studentModel.subject = _subjectcontroller.text.toString();

                studentModel.marks = _markscontroller.text.toString();

                var result = await _studentService.insertService(
                    "Student", studentModel);
                print("Result = $result");

                setState(() {
                  _namecontroller.clear();
                  _markscontroller.clear();
                  _subjectcontroller.clear();
                });
              },
              child: Text("submit"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mydashboardsqflite(),
              ));
        },
        child: Icon(Icons.list),
      ),
    );
  }
}
