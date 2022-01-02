import 'model/bottom_navigation_model.dart';
import 'chat/chat_view.dart';
import 'home/home_view.dart';
import 'search/search_view.dart';
import 'setting/setting_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Run
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin app',
      home: MainView(),
    );
  }
}

//MainView
class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  //ボトムナビゲーションページリスト
  final List<Widget> _pageList = <Widget>[
    const HomeView(),
    const SearchView(),
    const ChatView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationModel>(
      create: (_) => BottomNavigationModel(),
      child: Consumer<BottomNavigationModel>(builder: (context, model, child) {
        return Scaffold(
          //ボトムナビゲーション-------------------------------------
          body: _pageList[model.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              model.currentIndex =
                  index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      }),
    );
  }
}
