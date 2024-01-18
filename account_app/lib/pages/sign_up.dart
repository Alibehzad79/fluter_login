import 'package:account_app/pages/login.dart';
import 'package:account_app/providers/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Create Account",
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
                    if (value!.length < 3) {
                      return "Username length must be > 3";
                    } else if (value!.length > 12) {
                      return "Username length must be < 12";
                    } else {
                      return null;
                    }
                  },
                ),
                Gap(30),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (!value!.endsWith("@gmail.com")) {
                      return "Please Enter Valid G-mail.";
                    } else {
                      return null;
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
                        if (value!.length < 6) {
                          return "Password length must be > 6";
                        } else if (value!.length > 12) {
                          return "Password length must be < 12";
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
                Gap(30),
                Consumer<PasswordProvider>(
                  builder: (context, passwordProvider, child) {
                    return TextFormField(
                      controller: passwordConfirmController,
                      obscureText: passwordProvider.isObscurePasswordConfirm,
                      decoration: InputDecoration(
                        label: Text("Confirm Password"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            passwordProvider.getShowPasswordConfirm();
                          },
                          icon: passwordProvider.IconPasswordConfirm,
                        ),
                        hintText: "Enter Your Confirm Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 10),
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password Confirm length must be > 6";
                        } else if (value!.length > 12) {
                          return "Password Confirm length must be < 12";
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
                Gap(30),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
                Gap(100),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you have Account?"),
                      Gap(5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: Container(
                          child: Text(
                            "Login",
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
}
