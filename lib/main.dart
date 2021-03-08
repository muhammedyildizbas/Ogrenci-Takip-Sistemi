import 'package:flutter/material.dart';
import 'package:flutter_app2222/models/student.dart';
import 'package:flutter_app2222/screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent=Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1,"Muhammed", "Yıldızbaş", 25),
    Student.withId(2,"Kerem", "Varış", 65),
    Student.withId(3,"Halil ", "Duymaz", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png"),
                      ),
                      title: Text(students[index].firstName +
                          " " +
                          students[index].lastName),
                      subtitle: Text("sınavdan aldığı not: " +
                          students[index].grade.toString() +
                          " [" +
                          students[index].getStatus +
                          "]"),
                      trailing: buildStatusIcon(students[index].grade),
                      onTap: () {
                        setState(() {
                         selectedStudent = students[index];
                        });
                        print(selectedStudent.firstName + " "+ selectedStudent.lastName);
                      },
                    );
                  })),
          Text("Seçili Öğrenci: " + selectedStudent.firstName + " "+ selectedStudent.lastName),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.yellowAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.update),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Güncelle"),
                    ],
                  ),
                  onPressed: () {
                    var mesaj = "Güncellendi";
                    mesajGoster(context, mesaj);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text("Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });

                    var mesaj = "Silindi: "+ selectedStudent.firstName+" "+ selectedStudent.lastName;
                    mesajGoster(context, mesaj);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
