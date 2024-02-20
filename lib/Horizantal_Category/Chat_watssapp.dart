import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_donation/Horizantal_Category/chat.dart';
import 'package:url_launcher/url_launcher.dart';

class Message {
  String sender;
  String recipient;
  String content;

  Message(
      {required this.sender, required this.recipient, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'sender Name': sender,
      'recipient Number': recipient,
      'content': content,
    };
  }
}

class watssappChat extends StatefulWidget {
  @override
  _watssappChatState createState() => _watssappChatState();
}

class _watssappChatState extends State<watssappChat>
    with TickerProviderStateMixin {
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    final sender = _senderController.text;
    final recipient = _recipientController.text;
    final content = _contentController.text;

    if (sender.isNotEmpty && recipient.isNotEmpty && content.isNotEmpty) {
      final message =
          Message(sender: sender, recipient: recipient, content: content);
      await FirebaseFirestore.instance
          .collection('WatssappMessages')
          .add(message.toMap());
      _senderController.clear();
      _recipientController.clear();
      _contentController.clear();
    }
  }

  void _launchWhatsApp() async {
    final phoneNumber = _recipientController.text;
    final message = _contentController.text;

    if (phoneNumber.isNotEmpty && message.isNotEmpty) {
      if (phoneNumber.length < 10) {
        _showErrorDialog('Error',
            'Please enter a valid phone number with at least 10 digits.');
        return;
      }
      String url =
          'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
      if (await canLaunch(url)) {
        await FirebaseFirestore.instance.collection('WatssappMessages').add({
          'sender Name': _senderController.text,
          'recipient Number': phoneNumber,
          'content': message,
          'timestamp': Timestamp.now(),
        });
        await launch(url);
      } else {
        print('Failed to launch WhatsApp.');
      }
    } else {
      _showErrorDialog('Error', 'Recipient and content cannot be empty.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScaleTransition(
          scale: _scaleAnimation,
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
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
            Icons.arrow_back_ios_new,
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
          'WhatsApp Connect',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Send Message To Feed Forward',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _senderController,
                decoration: const InputDecoration(
                  labelText: 'Sender Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _recipientController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Recipient (Phone Number)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _contentController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16.0),
                elevation: 5.0,
              ),
              onPressed: _launchWhatsApp,
              child: const Text('Connect on WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}
