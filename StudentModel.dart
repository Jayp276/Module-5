import "package:flutter/material.dart";

class StudentModel {
  int? id;
  String? name, subject;
  String? marks;

  //StudentModel({this.id, this.marks, this.name, this.subject});

  studentMap() {
    var mapping = Map<String, dynamic>();

    mapping["id"] = id ?? null;
    mapping["name"] = name!;
    mapping["subject"] = subject!;
    mapping["marks"] = marks!;

    return mapping;
  }
}
