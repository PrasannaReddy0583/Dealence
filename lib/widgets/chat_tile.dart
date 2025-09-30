import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:striv/pages/chat_conversations_page.dart';
import 'package:striv/utils/app_palette.dart';

class ChatTile extends StatelessWidget {
  final String id;
  final String name;
  final String message;
  final String time;
  final int unread;
  final bool isHighlighted;
  final String avatar;

  const ChatTile({
    super.key,
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.unread = 0,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 25,
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChatConversationPage(
              id: id,
              name: name,
              message: message,
              time: time,
              unread: unread,
              isHighlighted: isHighlighted,
              avatar: avatar,
            ),
          ),
        );
      },
      leading: CircleAvatar(backgroundImage: AssetImage(avatar), radius: 26),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppPalette.textPrimary,
        ),
      ),
      subtitle: Text(message, style: const TextStyle(color: AppPalette.black)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: AppPalette.black),
          ),
          if (unread > 0)
            Padding(
              padding: EdgeInsets.only(top: 6, left: 34),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.orange,
                child: Text("$unread", style: TextStyle(fontSize: 12)),
              ),
            ),
        ],
      ),
    );
  }
}
