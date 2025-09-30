import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_palette.dart';

enum MessageStatus { sent, delivered, seen }

class ChatConversationPage extends StatelessWidget {
  final String id;
  final String name;
  final String message;
  final String time;
  final int unread;
  final bool isHighlighted;
  final String avatar;

  const ChatConversationPage({
    super.key,
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.unread,
    required this.isHighlighted,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppPalette.background,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: AppPalette.black,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/avatar2.png"),
              radius: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.green, size: 8),
                    const SizedBox(width: 4),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.phone, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.video_camera,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // Chat body
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(
                  text:
                      "Hi Amelia, I’m excited to connect and learn more about your venture. Your background in sustainable tech is impressive!",
                  time: "10:00 AM",
                  isSender: false,
                  avatar: "assets/avatar2.png",
                  status: MessageStatus.sent,
                ),
                ChatBubble(
                  text:
                      "Hi Ethan, thank you for reaching out! I’m equally thrilled to discuss how we can collaborate. I’ve attached a brief overview of my company for your review.",
                  time: "10:01 AM",
                  isSender: true,
                  avatar: "assets/avatar3.png",
                  status: MessageStatus.seen,
                ),
                ChatBubble(
                  text:
                      "Thanks, Amelia! I'll take a look. Perhaps we could schedule a quick video call to discuss further? I’m available tomorrow afternoon.",
                  time: "10:03 AM",
                  isSender: false,
                  avatar: "assets/avatar2.png",
                  status: MessageStatus.delivered,
                ),
                ChatBubble(
                  text:
                      "That sounds great, Ethan. Tomorrow afternoon works for me. Let’s aim for 3 PM EST?",
                  time: "10:05 AM",
                  isSender: true,
                  avatar: "assets/avatar3.png",
                  status: MessageStatus.delivered,
                ),
                ChatBubble(
                  text:
                      "That sounds great, Ethan. Tomorrow afternoon works for me. Let’s aim for 3 PM EST?",
                  time: "10:06 AM",
                  isSender: true,
                  avatar: "assets/avatar3.png",
                  status: MessageStatus.delivered,
                ),
                ChatBubble(
                  text:
                      "That sounds great, Ethan. Tomorrow afternoon works for me. Let’s aim for 3 PM EST?",
                  time: "10:07 AM",
                  isSender: true,
                  avatar: "assets/avatar3.png",
                  status: MessageStatus.seen,
                ),
              ],
            ),
          ),

          // Message Input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppPalette.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, -1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppPalette.transparent,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: AppPalette.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppPalette.primaryBackground,
                          hintText: "Type a message...",
                          hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: AppPalette.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: AppPalette.black),
                  onPressed: () {},
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppPalette.messageColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.send,
                    color: AppPalette.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isSender;
  final String avatar;
  final MessageStatus status;

  const ChatBubble({
    super.key,
    required this.text,
    required this.time,
    required this.isSender,
    required this.avatar,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isSender)
                CircleAvatar(
                  minRadius: 16,
                  backgroundColor: AppPalette.messageColor,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatar),
                    radius: 14,
                  ),
                ),
              if (!isSender) const SizedBox(width: 6),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSender
                        ? AppPalette.messageColor
                        : AppPalette.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: isSender ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              if (isSender) const SizedBox(width: 6),
              if (isSender)
                CircleAvatar(
                  minRadius: 16,
                  backgroundColor: AppPalette.messageColor,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatar),
                    radius: 14,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
              if (isSender && status == MessageStatus.sent)
                Icon(CupertinoIcons.checkmark_alt, size: 18),
              if (isSender && status == MessageStatus.delivered)
                Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 18,
                  color: AppPalette.unseen,
                ),
              if (isSender && status == MessageStatus.seen)
                Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 18,
                  color: AppPalette.seen,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
