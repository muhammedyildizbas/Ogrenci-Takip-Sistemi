class Student {
  int id;
  String firstName ;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id,String firstName , String lastName , int grade ){
    this.id =id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }  //güncelleme yapılırken kullanılacak id li sistem

  Student (int id,String firstName , String lastName , int grade ){
    this.id =id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  } // ekleme yapılırken kullanılacak sistem
  Student.withoutInfo(){

  }
  String get getFirstName{
    return "OGR - "+ this.firstName;

  }
  void set setFirstName(String value){
    this.firstName = value;

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