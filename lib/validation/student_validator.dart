class StudentValidationMixin{
  String valiateFirstName(String value){
    if(value.length<2){
      return "İsim en iki karakter olmalıdır" ;
    }
  }
}