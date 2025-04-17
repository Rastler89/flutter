import 'package:flutter/material.dart';
import 'package:yesno/presentation/widgets/chat/him_message_bubble.dart';
import 'package:yesno/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://imgs.search.brave.com/wXRj7q7LIGI_HtYeBFKhDTqcII8P4AjIpyg7d6WzKmw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9yZW5k/ZXIuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy9yZW5kZXJl/ZC9zZWFyY2gvcHJp/bnQvNi84L2JyZWFr/L2ltYWdlcy1tZWRp/dW0tNS92YWRlci13/YXRlcmNvbG9yLXBh/aW50aW5nLW9sZ2Et/c2h2YXJ0c3VyLmpw/Zw'),
          ),
        ),
        title: Text('Mi lado oscuro'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: [
            Expanded (child: 
              ListView.builder(
                itemCount:100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0) ? HimMessageBubble() : MyMessageBubble();
                },
              ),
            ),         
            ],
          ),
      ),
    );
  } 
}