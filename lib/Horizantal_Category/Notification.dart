import 'package:flutter/material.dart';
import 'package:food_donation/layout/screen_layout.dart';
import 'dart:math';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> notifications = [
    "Notification 1",
    "Notification 2",
    "Notification 3",
  ];

  // Function to generate a random notification
  String _generateRandomNotification() {
    final random = Random();
    return "Notification ${random.nextInt(100)}";
  }

  // Function to delete a notification
  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
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
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const ScreenLayout(),
              ),
            );
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(notifications[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => _deleteNotification(index),
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                // Replace with the person's image
                backgroundImage: AssetImage('images/logo1.jpg'),
              ),
              title: Text(notifications[index]),
              subtitle: const Text('Sender Name'),
              onTap: () {
                // Show more options dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('More Options'),
                      content: Column(
                        children: [
                          const Text('Sender: Sender Name'),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              // Handle update option
                              Navigator.pop(context);
                            },
                            child: const ListTile(
                              leading: Icon(Icons.update),
                              title: Text('Update'),
                            ),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              // Handle delete option
                              Navigator.pop(context);
                            },
                            child: const ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              // Handle other option
                              Navigator.pop(context);
                            },
                            child: const ListTile(
                              leading: Icon(Icons.more_horiz),
                              title: Text('Other'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'update',
                    child: Text('Update'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                  const PopupMenuItem(
                    value: 'other',
                    child: Text('Other'),
                  ),
                ],
                onSelected: (value) {
                  // Handle selected option from the kebab menu
                  if (value == 'update') {
                    // Handle update option
                  } else if (value == 'delete') {
                    // Handle delete option
                  } else if (value == 'other') {
                    // Handle other option
                  }
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            notifications.add(_generateRandomNotification());
          });
        },
        child: const Icon(Icons.add_alert_outlined),
      ),
    );
  }
}
