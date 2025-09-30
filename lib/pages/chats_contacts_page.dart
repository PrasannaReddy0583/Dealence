import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:striv/utils/app_palette.dart';
import 'package:striv/widgets/chat_tile.dart';

class Chat {
  final String id;
  final String name;
  final String message;
  final String time;
  final String avatar;
  final int unread;
  final bool isHighlighted;

  Chat({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.unread = 0,
    this.isHighlighted = false,
  });
}

final List<Chat> chats = [
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493332341",
    name: "Sophia Carter",
    message: "See you soon!",
    time: "10:30 AM",
    avatar: "assets/avatar1.png",
    unread: 2,
  ),
  Chat(
    id: "9493332331",
    name: "Ethan Bennett",
    message: "Sounds good!",
    time: "9:45 AM",
    avatar: "assets/avatar2.png",
    isHighlighted: true,
  ),
  Chat(
    id: "9463332341",
    name: "Olivia Hayes",
    message: "I'll be there in 10 minutes",
    time: "8:15 AM",
    avatar: "assets/avatar3.png",
  ),
  Chat(
    id: "9673332341",
    name: "Noah Thompson",
    message: "Can we reschedule?",
    time: "Yesterday",
    avatar: "assets/avatar4.png",
  ),
  Chat(
    id: "9493552341",
    name: "Ava Mitchell",
    message: "Thanks for the update",
    time: "Yesterday",
    avatar: "assets/avatar5.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
  Chat(
    id: "9493338341",
    name: "Liam Parker",
    message: "No problem!",
    time: "2 days ago",
    avatar: "assets/avatar6.png",
  ),
];

class ChatsContactsPage extends StatelessWidget {
  const ChatsContactsPage({super.key, required bool isInvestor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Text(
                      "Chats",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.textPrimary,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppPalette.white,
                    child: Icon(Icons.edit, color: AppPalette.iconColor),
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(
                      CupertinoIcons.search,
                      color: AppPalette.iconColor,
                      weight: 10.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Chats List
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatTile(
                    id: chat.id,
                    name: chat.name,
                    message: chat.message,
                    time: chat.time,
                    avatar: chat.avatar,
                    unread: chat.unread,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
