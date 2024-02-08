import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late String message;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User? loggedInUser;
late final String? email;

class ChatScreen extends StatefulWidget {
  static String id = '/Chat_Screen';

  const ChatScreen({super.key});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageTextFieldController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
        email = loggedInUser?.email;
      } else {
        print('User Not Logged In');
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshots in _firestore.collection('messages').snapshots()) {
      for (var message in snapshots.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                // await _auth.signOut();
                // Navigator.pop(context);
                messagesStream();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: MessageTextFieldController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      MessageTextFieldController.clear();
                      try {
                        _firestore
                            .collection('messages')
                            .add({"text": message, "sender": email});
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshots) {
          List<Widget> messageBubbles = [];
          if (snapshots.hasData) {
            for (var message in snapshots.data!.docs) {
              final messages = message.data();
              final messageText = messages['text'];
              final messageSender = messages['sender'];
              final currentUser = loggedInUser?.email;
              if(currentUser == messageSender){
                //The message is from the loggedin User
              }
              final messageBubble =
                  MessageBubble(sender: messageSender, text: messageText , isMe: currentUser == messageSender,);
              messageBubbles.add(messageBubble);
            }
          } else {
            return const Center(
              child: Text('Hello'),
            );
          }
          return Expanded(
            child: ListView(
              children: messageBubbles,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.sender, required this.text , required this.isMe});
  final String sender;
  final String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            elevation: 5.0,
            color: isMe == true ? Colors.yellow : Colors.lightBlueAccent,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
              child: Text(
                text,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
          Text(
            sender,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
