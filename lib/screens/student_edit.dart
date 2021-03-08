import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2222/models/student.dart';
import 'package:flutter_app2222/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent= selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  _StudentAddState(Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body:Container(
        margin:  EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue:  selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Muhammed "),
      validator: valiateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }
  Widget buildLastNameField() {
    return  TextFormField(
      initialValue:  selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Öğrenci Soyadı ", hintText: "Yıldızbaş"),
      validator: valiateLastName,
      onSaved:  (String value){
        selectedStudent.lastName=value;
      },
    );
  }
  Widget buildGradeField() {
    return  TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı Not ", hintText: "70"),
      validator: validateGrate,
      onSaved:  (String value){
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child:  Text("Kaydet"),
      onPressed:() {
        if(formKey.currentState.validate()){
          formKey.currentState.save();

          saveStudent();
          Navigator.pop(context);
        }
      },
    );

  }
  void saveStudent(){
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
