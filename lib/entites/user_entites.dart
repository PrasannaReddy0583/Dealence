enum UserRoleInPlatformEnum { entrepreneur, investor, both }

// lib/features/user/domain/entities/user.dart
class UserEntites {
  final String userid; // unique userId
  final String email; // registered phone
  final String phoneNumber;
  final String username;
  final String indentityDocumentProof;
  final String password;

  /// final String name; // display name // Derived from document and made unqiue in the database
  final String image; // profile picture URL
  // final String bio; // "Hey there! I am using..."
  final UserRoleInPlatformEnum userRoleInPlatform;
  final DateTime createdAt;

  UserEntites({
    required this.userid,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.username,
    required this.indentityDocumentProof,
    required this.image,
    required this.createdAt,
    required this.userRoleInPlatform,
  });
}
