import 'package:flutter/material.dart';

class MessageDesign extends StatelessWidget {
  MessageDesign(this.message, this.isCurrentUser, this.username, {this.key});

  final String message;
  final bool isCurrentUser;
  final String username;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          width: 140,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: isCurrentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentTextTheme.title.color),
              ),
              Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).accentTextTheme.title.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
