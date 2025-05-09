import 'package:flutter/material.dart';
import 'package:yesno/config/helpers/get_yes_no_answer.dart';
import 'package:yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('? ') || text.endsWith('?')) {
      himReply();
    } 

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> himReply() async {
    final himMessage = await getYesNoAnswer.getAnswer();
    messageList.add(himMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 150));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}