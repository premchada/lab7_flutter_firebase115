
import 'package:auth_buttons/auth_buttons.dart';
import 'package:csfirebaseauth/page/homepage.dart';
import 'package:csfirebaseauth/page/register_page.dart';
import 'package:csfirebaseauth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailInput(),
            paaswordInput(),
            signupButton(),
            signinButton(),
            const Divider(),
            GoogleAuthButton(
              onPressed: () async {
                UserCredential userCredential = await signInWithGoogle();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          HomePage(userdata: userCredential)),
                    ));
                // your implementation
              },
              darkMode: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget emailInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget paaswordInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _pass,
        obscureText: true,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.password)),
      ),
    );
  }

  signupButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          RegisterPage()),
                    ));
              // registerUser(_email.text, _pass.text);
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  signinButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              UserCredential userCredential = await signInWithGoogle();
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          HomePage(userdata: userCredential)),
              ));
              //loginUser(_email.text, _pass.text);
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
