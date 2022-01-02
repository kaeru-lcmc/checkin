import 'package:flutter/material.dart';

import 'chat_screen_view.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const ChatScreenView();
              }));
            },
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 8.0,
            ),
            leading: ClipOval(
              child: Image.asset(
                'assets/img/chat_icon2.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            trailing: const Text('3分前'),
            title: const Text('三男'),
            subtitle: const Text('おんがーく！'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 8.0,
            ),
            leading: ClipOval(
              child: Image.asset(
                'assets/img/chat_icon1.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            trailing: const Text('1分前'),
            title: const Text('かえる'),
            subtitle: const Text('けろけろ'),
          ),
        ],
      ),
    );
  }
}
