enum MessageType {
  text,
  image,
  video,
  audio,
  document,
  contact,
  location,
  sticker,
  voiceNote,
}

enum MessageStatus { sent, delivered, seen }

class MessageEntites {
  final String id; // unique message id
  final String chatId; // chat it belongs to
  final String senderId; // who sent it
  final List<String> receiverIds; // supports groups
  final String? text; // text content
  final String? mediaUrl; // image/video/audio/document link
  final MessageType type; // type of message
  final DateTime time; // timestamp
  final MessageStatus status; // ✔, ✔✔, ✔✔ blue
  final String? replyTo; // reply to message id
  final bool forwarded; // forwarded message
  final bool deleted; // deleted for everyone
  final bool isEdited; // edited message
  final bool isStarred; // starred message (saved)

  MessageEntites({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverIds,
    this.text,
    this.mediaUrl,
    this.type = MessageType.text,
    required this.time,
    this.status = MessageStatus.sent,
    this.replyTo,
    this.forwarded = false,
    this.deleted = false,
    this.isEdited = false,
    this.isStarred = false,
  });
}
