import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? removeitem;

  Todolist(
      {super.key,
      required this.taskname,
      required this.onchanged,
      required this.taskcompleted,
      required this.removeitem});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: removeitem,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskcompleted,
                  onChanged: onchanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskname,
                  style: TextStyle(
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
