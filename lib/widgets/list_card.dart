import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListCard extends StatelessWidget {
  final String job;
  final bool value;
  final Function(bool?) onchanges;
  Function(BuildContext)? deleteTask;

  ListCard({
    required this.job,
    required this.value,
    required this.onchanges,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
            ),
          ],
        ),
        child: Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: Checkbox(
              activeColor: Colors.black,
              onChanged: onchanges,
              //shape: const CircleBorder(),
              value: value,
            ),
            tileColor: const Color(0xff4E6C50),
            title: Text(
              job,
              style: TextStyle(
                  decoration: value ? TextDecoration.lineThrough : null),
            ),
          ),
        ),
      ),
    );
  }
}
