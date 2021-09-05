import 'package:uuid/uuid.dart';

class Task implements Comparable<Task>{
    String uuid = Uuid().v1();
    String title;
    bool ok;

    Task({this.title, this.ok});


    Task.fromJson(Map<String, dynamic> json):
      this.title = json['title'],
      this.ok =  json['ok'],
      this.uuid =  json['uuid'];
    

    Map<String, dynamic> toJson(){
      return 
      {
        'title': this.title,
        'ok': this.ok,
        'uuid': this.uuid,
      };
    }

  @override
  int compareTo(Task other) {
    if (other == null){
      return 1;
    }
    return this.ok && !other.ok ? 1 : -1;
  }
}