import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Merhaba İlk Uygulamam";
  var ogrenciler = [
    "Engin Demirog ",
    "Kerem Varıs",
    "Berkay Bilgin"
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context)
      ,
    );
  }

  String sinavHesapla(int puan) {

    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Gecti";
    } else if (puan >= 40) {
      mesaj = "Butunlemeye Kaldı";
    } else {
      mesaj = "Kaldi";
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

 Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: ogrenciler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ogrenciler[index]);
                })),
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
    );
  }
}
