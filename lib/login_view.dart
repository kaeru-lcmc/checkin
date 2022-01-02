import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'signup_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Form(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _emailInputController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _passwordInputController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        child: const Text('ログイン'),
                        onPressed: () async {
                          final String _email = _emailInputController.text;
                          final String _password =
                              _passwordInputController.text;
                          // ここにログイン処理を書く
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainView(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupView()),
                          );
                        },
                        child: const Text(
                          '新規登録はこちら',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
