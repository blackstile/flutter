
class ApiResponse<T> {

  bool? ok;
  String? message;
  T? content;

  ApiResponse.ok(this.content){
    ok =  true;
  }

  ApiResponse.error(this.message){
    ok =  false;
  }

}