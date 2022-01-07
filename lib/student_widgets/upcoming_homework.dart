import 'package:flutter/material.dart';

class UpcomingHomeworkWidget extends StatelessWidget {
  final String id;
  final String description;
  final String dueDate;

  UpcomingHomeworkWidget(
    this.id,
    this.description,
    this.dueDate,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('Lesson details:'),
        title: Card(
          child: Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(description),
                      Text(dueDate),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
