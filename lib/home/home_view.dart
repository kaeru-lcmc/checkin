import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../signin/login_view.dart';
import '../signin/signup_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('HOME'),
    ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: const Text('次へ'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupView(),
                    ),
                  );
                },
              ),
              TextButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ),
                label: const Text(
                  'サインアウト',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
