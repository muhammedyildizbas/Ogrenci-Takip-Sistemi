import 'package:flutter/material.dart';
import 'package:flutter_app2222/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  }

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  String seciliOgrenci= "abc";

  List <Student> students = [Student("Engin","Demiroğ",25),Student("Kerem","Varış",65),Student("Halil ","Duymaz",45)];

  var ogrenciler = [
    "Engin Demirog ",
    "Kerem Varıs",
    "Berkay Bilgin"];

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
                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png"),
                      ),
                      title: Text(students[index].firsName + " "+ students[index].lastName),
                      subtitle:Text("sınavdan aldığı not: "+ students[index].grade.toString()+" ["+students[index].getStatus+"]"),
                      trailing: buildStatusIcon(students[index].grade),
                      onTap: (){
                       setState(() {
                         seciliOgrenci = students[index].firsName + " "+ students[index].lastName;
                       });
                        print(seciliOgrenci);

                      },
                    );
                  })),
          Text("Seçili Öğrenci: "+ seciliOgrenci),
          Center(
            child: RaisedButton(
              child: Text("Sonuc"),
              onPressed: () {
                var mesaj = sinavHesapla(55);
                mesajGoster(context, mesaj);
              },
            ),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int puan) {
String mesaj = "";
if(puan>=50){
  mesaj="Geçti";
  }
 else if (puan >=40){
   mesaj="Bütünlemeye Kaldı";
 }
 else {
   mesaj="Kaldi";

 }
 return mesaj;

  }

  void mesajGoster(BuildContext context,String mesaj) {
    var alert = AlertDialog(
      title: Text("Sinav Sonucu"),
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

