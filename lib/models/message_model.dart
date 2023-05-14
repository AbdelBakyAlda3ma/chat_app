import 'package:chat_app/constantces.dart';

class Message {
  String messageBody;
  Message(this.messageBody);
  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessageBody]);
  }
}
