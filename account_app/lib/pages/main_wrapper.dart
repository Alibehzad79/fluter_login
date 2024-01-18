import 'package:account_app/main.dart';
import 'package:account_app/pages/login.dart';
import 'package:account_app/pages/sign_up.dart';
import 'package:account_app/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final saveLoginTokenProvider =
        Provider.of<SaveLoginTokenProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Account"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Main Wrapper"),
            Consumer<SaveLoginTokenProvider>(
              builder: (context, saveLoginTokenProvider, child) {
                return ElevatedButton(
                  onPressed: () {
                    logout(saveLoginTokenProvider);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(saveLoginTokenProvider) async {
    await saveLoginTokenProvider.removeToken();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );
  }
}
