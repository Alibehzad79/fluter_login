import 'package:account_app/models/user_model.dart';
import 'package:account_app/pages/main_wrapper.dart';
import 'package:account_app/pages/sign_up.dart';
import 'package:account_app/providers/account_provider.dart';
import 'package:account_app/providers/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final saveLoginTokenProvider =
        Provider.of<SaveLoginTokenProvider>(context, listen: false);
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Login to your Account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Gap(30),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text("Username"),
                    hintText: "Enter Your Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10),
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username is empty";
                    }
                  },
                ),
                Gap(30),
                Consumer<PasswordProvider>(
                  builder: (context, passwordProvider, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: passwordProvider.isObscurePassword,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter Your Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              passwordProvider.getShowPassword();
                            },
                            icon: passwordProvider.iconPassword),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 10),
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is empty";
                        }
                      },
                    );
                  },
                ),
                Gap(30),
                Consumer<AccountProvider>(
                    builder: (context, accountProvider, child) {
                  switch (accountProvider.status) {
                    case 204:
                      return CircularProgressIndicator();
                    case 200:
                      saveLoginTokenProvider
                          .addToken(accountProvider.data.access);
                      WidgetsBinding.instance!.addPostFrameCallback(
                        (timeStamp) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainWrapper(),
                          ),
                        ),
                      );
                      return loginBtn(accountProvider);
                    case 400:
                      return Column(
                        children: [
                          loginBtn(accountProvider),
                          Gap(20),
                          Text(
                            "Username or Password is Wrong!",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      );
                    default:
                      return loginBtn(accountProvider);
                  }
                }),
                Gap(100),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you not have Account?"),
                      Gap(5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ));
                        },
                        child: Container(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginBtn(AccountProvider accountProvider) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            accountProvider.get_user_token(
                usernameController.text, passwordController.text);
          }
        },
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
