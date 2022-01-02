import 'package:flutter/material.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text(
          '三男',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 32.0,
                ),
                child: Column(
                  children: <Widget>[
                    rightBalloon(),
                    leftBalloon(),
                    rightBalloon(),
                    leftBalloon(),
                    rightBalloon(),
                    leftBalloon(),
                  ],
                ),
              ),
            ),
            textInputWidget(),
          ],
        ),
      ),
    );
  }

  Padding leftBalloon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'assets/img/chat_icon2.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: Color.fromARGB(255, 233, 233, 233),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('けろけろ'),
            ),
          )
        ],
      ),
    );
  }

  Padding rightBalloon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Color.fromARGB(255, 108, 132, 235),
                Color.fromARGB(250, 132, 199, 250),
              ],
              stops: [
                0.0,
                1.0,
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'おんがーく！！！',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox textInputWidget() {
    return SizedBox(
      height: 68,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              iconSize: 28,
              color: Colors.black54,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.photo_outlined),
              iconSize: 28,
              color: Colors.black54,
              onPressed: () {},
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )),
            IconButton(
              icon: const Icon(Icons.mic),
              iconSize: 28,
              color: Colors.black54,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
