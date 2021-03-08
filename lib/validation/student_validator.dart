class StudentValidationMixin{
  String valiateFirstName(String value){
    if(value.length<2){
      return "İsim en az iki karakter olmalıdır" ;
    }
  }
  String valiateLastName(String value){
    if(value.length<2){
      return "Soyadı en az iki karakter olmalıdır" ;
    }
  }
  String validateGrate(String value){
    var grade = int.parse(value);
    if(grade<0 || grade>100){
      return "Not 0-100 arasında olmalıdır" ;
    }
  }
}