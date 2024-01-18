import 'package:account_app/pages/login.dart';
import 'package:account_app/pages/main_wrapper.dart';
import 'package:account_app/pages/sign_up.dart';
import 'package:account_app/providers/account_provider.dart';
import 'package:account_app/providers/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaveLoginTokenProvider(),
        ),
      ],
      child: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Account App",
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SharedPreferences sharedPreferences = snapshot.data!;
            var isLogined = sharedPreferences.getBool("haveToken") ?? false;
            if (isLogined) {
              return MainWrapper();
            } else {
              return LoginPage();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// TODO Create account login and register Provider and UserModel