import 'package:hive/hive.dart';

class Tododatabase{
final mybox=Hive.box("mybox");
List todolist=[];
void createinitialdata(){
  todolist=[
    ["make Tutorial",false],
    ["Do Exercise",false],
  ];
}
void loaddata(){
  todolist=mybox.get("TODOLIST");
}

void updatedatabase(){
  mybox.put("TODOLIST", todolist);
}
}