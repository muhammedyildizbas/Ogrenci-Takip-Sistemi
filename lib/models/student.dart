class Student {
  int id;
  String firsName ;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id,String firstName , String lastName , int grade ){
    this.id =id;
    this.firsName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }  //güncelleme yapılırken kullanılacak id li sistem

  Student (int id,String firstName , String lastName , int grade ){
    this.id =id;
    this.firsName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  } // ekleme yapılırken kullanılacak sistem
  String get getFirstName{
    return "OGR - "+ this.firsName;

  }
  void set setFirstName(String value){
    this.firsName = value;

  }

  String get getStatus{
  String message = "";
  if(this.grade>=50){
  message="Geçti";
  }
  else if (this.grade>=40){
  message="Bütünlemeye Kaldı";
  }
  else {
  message="Kaldi";
  }
  return message;
}
}