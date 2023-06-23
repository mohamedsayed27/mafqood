import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String? receiverId;
  final String? senderId;
  final String? messageText;
  final String? dateTime;
  final String? messageType;
  final String? image;
  final String? messageId;
  final bool? isMessageRead;

  const MessageModel({
    this.messageText,
    this.receiverId,
    this.senderId,
    this.dateTime,
    this.messageId,
    this.messageType,
    this.image,
    this.isMessageRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json, String messageId) {
    return MessageModel(
        receiverId: json['receiverId'],
        senderId: json['senderId'],
        messageText: json['messageText'],
        dateTime: json['dateTime'],
        messageType: json['messageType'],
        messageId: messageId,
        image: json['image'],
        isMessageRead: json['isMessageRead']);
  }

  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
      'senderId': senderId,
      'messageText': messageText,
      'dateTime': dateTime,
      'image': image,
      'messageType': messageType,
      'isMessageRead': isMessageRead,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        senderId,
        receiverId,
        messageText,
        dateTime,
        isMessageRead,
        image,
        messageId,
        messageType,
      ];
}
