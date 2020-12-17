import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final String userImage;
  final bool isMe;
  final Key key;

  MessageBubble(this.message, this.username, this.userImage, this.isMe, {this.key});

  @override
  Widget build(BuildContext context) {
    print(userImage);
    return Stack(
      children: [
        Row(
          mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(12)
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10, 
                horizontal: 16
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8
              ),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentTextTheme.headline1.color
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe 
                        ? Colors.black
                        : Theme.of(context).accentTextTheme.headline1.color
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ]
              )
            ),
          ]
        ),
        Positioned(
          top: 0,
          right: isMe ? 120 : null,
          left: isMe ? null : 120,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}