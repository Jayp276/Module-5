import 'package:flutter1/Offline%20Database/Repository.dart';
import 'package:flutter1/Offline%20Database/StudentModel.dart';

class StudentService {
  late Repository _repository;

  StudentService() {
    _repository = Repository(); //initlization
  }

  insertService(table, StudentModel studentModel) async {
    return await _repository.insertRecord(table, studentModel.studentMap());
  }

  readService(table) async {
    return await _repository.fetchRecord(table);
  }

  updateService(table, StudentModel studentModel) async {
    return await _repository.updataRecord("Student", studentModel.studentMap());
  }

  deleteService(table, StudentModel studentModel) async {
    return await _repository.deletRecord(table, studentModel.studentMap());
  }
}
