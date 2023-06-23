import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<MessageModel> messagesList = [];
  File? profileImage;
  ImagePicker picker = ImagePicker();

  Future<void> getImagePick() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(GetProfilePickedImageSuccessState());
    } else {
      emit(GetProfilePickedImageErrorState());
    }
  }

  final instance = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> firebaseSendMessageInstanceForSender({
    required dynamic senderId,
    required dynamic receiverId,
  }) {
    return instance
        .collection('users')
        .doc("$senderId")
        .collection("chats")
        .doc("$receiverId");
  }

  DocumentReference<Map<String, dynamic>>
      firebaseSendMessageInstanceForReceiver({
    required dynamic senderId,
    required dynamic receiverId,
  }) {
    return instance
        .collection('users')
        .doc("$receiverId")
        .collection("chats")
        .doc("$senderId");
  }

  FirebaseStorage storage = FirebaseStorage.instance;

  void uploadPhotoToFirebase({
    required dynamic receiverId,
    required String? receiverName,
    required String? senderName,
    required String? receiverImg,
    required String? senderImg,
    required String? dateTime,
    required bool? isMessageRead,
  }) async {
    emit(SendImageLoadingState());
    try {
      Reference ref =
          storage.ref().child("images").child(userId!).child(const Uuid().v1());
      UploadTask uploadTask = ref.putFile(profileImage!);
      TaskSnapshot snap = await uploadTask;
      String url = await snap.ref.getDownloadURL();
      await sendMessage(
        receiverId: receiverId,
        senderId: userId,
        receiverName: receiverName,
        senderName: senderName,
        receiverImg: receiverImg,
        senderImg: senderImg,
        dateTime: dateTime,
        image: url,
        messageType: 'image',
        text: null,
        isMessageRead: isMessageRead,
      );
      emit(SendImageSuccessState());
    } catch (e) {
      emit(SendImageErrorState());
    }
  }

  Future<void> sendMessage({
    required dynamic receiverId,
    required dynamic senderId,
    required String? receiverName,
    required String? senderName,
    required String? receiverImg,
    required String? senderImg,
    required String? text,
    required String? dateTime,
    required String? image,
    required String? messageType,
    required bool? isMessageRead,
  }) async {
    MessageModel model = MessageModel(
      receiverId: receiverId,
      messageText: text,
      dateTime: dateTime,
      senderId: senderId,
      image: image,
      messageType: messageType,
      isMessageRead: isMessageRead,
    );
    DocumentSnapshot<Map<String, dynamic>> docUser =
        await firebaseSendMessageInstanceForSender(
      senderId: senderId,
      receiverId: senderId,
    ).get();
    if (docUser.data() == null) {
      firebaseSendMessageInstanceForSender(
        senderId: senderId,
        receiverId: senderId,
      ).set({
        "profileImage": receiverImg,
        "lastMessage": text,
        "name": receiverName,
        "dateTime": dateTime,
        "id": "$receiverId",
      }).then((value) {
        firebaseSendMessageInstanceForSender(
          senderId: senderId,
          receiverId: senderId,
        ).collection('messages').add(model.toJson()).then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    } else {
      firebaseSendMessageInstanceForSender(
        senderId: senderId,
        receiverId: senderId,
      ).update({"dateTime": dateTime, "lastMessage": text}).then((value) {
        firebaseSendMessageInstanceForSender(
          senderId: senderId,
          receiverId: senderId,
        ).collection('messages').add(model.toJson()).then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    }

    DocumentSnapshot<Map<String, dynamic>> docProvider =
        await firebaseSendMessageInstanceForReceiver(
      senderId: senderId,
      receiverId: receiverId,
    ).get();
    if (docProvider.data() == null) {
      firebaseSendMessageInstanceForReceiver(
        senderId: senderId,
        receiverId: receiverId,
      ).set({
        "profileImage": senderImg,
        "name": senderName,
        "dateTime": dateTime,
        "lastMessage": text,
        "id": "$senderId",
      }).then((value) {
        firebaseSendMessageInstanceForReceiver(
          senderId: senderId,
          receiverId: receiverId,
        ).collection('messages').add(model.toJson()).then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    } else {
      firebaseSendMessageInstanceForReceiver(
        senderId: senderId,
        receiverId: receiverId,
      ).update({"dateTime": dateTime, "lastMessage": text}).then((value) {
        firebaseSendMessageInstanceForReceiver(
          senderId: senderId,
          receiverId: receiverId,
        ).collection('messages').add(model.toJson()).then((value) {
          emit(SendMessageSuccess());
        }).catchError((error) {
          emit(SendMessageError(error: error.toString()));
        });
      });
    }

    //receiver chats
  }

  void updateMessageSeenIcon({
    required dynamic senderId,
    required dynamic receiverId,
    required String messageId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc("$receiverId")
        .collection("chats")
        .doc("$senderId")
        .collection('messages')
        .doc(messageId)
        .update({
      "isMessageRead": true,
    });
  }

  Future getMessages({
    required dynamic receiverId,
    required dynamic senderId,
  }) async {
    firebaseSendMessageInstanceForSender(
      senderId: senderId,
      receiverId: senderId,
    ).collection('messages').orderBy('dateTime').snapshots().listen((event) {
      messagesList = [];
      for (var element in event.docs.reversed) {
        messagesList.add(MessageModel.fromJson(element.data(), element.id));
      }
      emit(GetMessageSuccess());
    });
  }
}
