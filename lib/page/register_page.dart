import 'package:csfirebaseauth/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            paaswordInput(),
            regisButton(),
          ],
        ),
      )),
    );
  }

  Widget nameInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _name,
        decoration: const InputDecoration(
            hintText: "input your name", prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget emailInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(
            hintText: "input your email", prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget paaswordInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _pass,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "input password", prefixIcon: Icon(Icons.password)),
      ),
    );
  }

  regisButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              //loginUser(_email.text, _pass.text);
              registerUser(_email.text, _pass.text, _name.text).then((value) {
                Navigator.pop(context);
              });
            },
            child: const Text('Regiser'),
          ),
        ],
      ),
    );
  }
}
