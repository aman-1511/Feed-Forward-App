// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_donation/Horizantal_Category/chat.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBox> {
  List<Message> messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      messages.add(Message(content: message, isUser: true));
    });

    // Store user message in Firebase
    FirebaseFirestore.instance.collection('messages').add({
      'content': message,
      'isUser': true,
    });

    // Simulate chat bot response with a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      String botResponse = _getBotResponse(message);
      setState(() {
        messages.add(Message(content: botResponse, isUser: false));
      });

      // Store bot response in Firebase
      FirebaseFirestore.instance.collection('messages').add({
        'content': botResponse,
        'isUser': false,
      });
    });

    _textEditingController.clear();
  }

  String _getBotResponse(String question) {
    // You can implement your own logic here to generate a response based on the user's question
    // For simplicity, let's just return a predefined response for now
    if (question.contains('hello') || question.contains('Hello')) {
      return 'Welcome To Feed Forward! \nHow can I help You ..';
    } else if (question.contains('how are you') ||
        question.contains('How are you')) {
      return 'I am a bot, so I am always fine!\nWhat about you';
    } else if (question.contains('I am good') ||
        question.contains('I am fine') ||
        question.contains('good') ||
        question.contains('fine') ||
        question.contains('Fine') ||
        question.contains('Good')) {
      return 'How can I help you';
    } else if (question.contains('Is my donation tax-deductible?')) {
      return 'Yes \n For furthur details click on the link below';
    } else if (question.contains(
        'Is there a minimum or maximum amount of food I can donate?')) {
      return 'No! You can donate as much food as you want it will benifits the others';
    } else {
      return 'I am sorry, I do not understand.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4CF),
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 20,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xffFFB200),
              // Color(0xffFEB139),
              Color(0xffFFDE00),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ChatScreen(),
              ),
            );
          },
        ),
        title: const Text(
          'Chat Bot',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: messages[index].isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: messages[index].isUser
                            ? const Color.fromARGB(255, 59, 206, 239)
                            : const Color.fromARGB(255, 224, 224, 224),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        messages[index].content,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _sendMessage(value);
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Ask me a question...',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String message = _textEditingController.text;
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  String content;
  bool isUser;
  Message({required this.content, required this.isUser});
}
