import 'package:flutter/material.dart';
import 'package:food_donation/Horizantal_Category/Chat_bot.dart';
import 'package:food_donation/Horizantal_Category/Chat_watssapp.dart';

import 'package:food_donation/layout/screen_layout.dart';

class ChatOption {
  String title;
  String subtitle;
  String imageUrl;

  ChatOption(
      {required this.title, required this.subtitle, required this.imageUrl});
}

class ChatScreen extends StatelessWidget {
  final List<ChatOption> chatOptions = [
    ChatOption(
      title: "Bot",
      subtitle: "Chat with Bot",
      imageUrl: "images/bot.png",
    ),
    ChatOption(
      title: "WhatsApp",
      subtitle: "Chat with WhatsApp",
      imageUrl: "images/watssapp.png",
    ),
  ];

  ChatScreen({super.key});

  void openChat(String option) {
    // Logic to open chat with selected option (Boat/WhatsApp)
    print("Opening chat with $option");
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
              // Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        title: const Text(
          "Chat Us",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const ScreenLayout(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Chat Option",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChatBox();
                      },
                    ),
                  );
                },
                child: Card(
                  color: const Color(0xffFFFAE7),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    height: 180,
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          chatOptions[0].imageUrl,
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          chatOptions[0].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chatOptions[0].subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return watssappChat();
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  color: const Color(0xffFFFAE7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    height: 180,
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          chatOptions[1].imageUrl,
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          chatOptions[1].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chatOptions[1].subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
