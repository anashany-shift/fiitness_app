import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

enum MessageSender { user, ai }

class MessageModel extends Equatable {
  final String text;
  final MessageSender sender;
  final DateTime dateTime;

  const MessageModel({
    required this.text,
    required this.sender,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'sender': sender.name, // user | ai
        'createdAt': Timestamp.fromDate(dateTime),
      };

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        text: json['text'],
        sender: json['sender'] == 'user'
            ? MessageSender.user
            : MessageSender.ai,
        dateTime: (json['createdAt'] as Timestamp).toDate(),
      );

  @override
  List<Object?> get props => [text, sender, dateTime];
}
