import 'package:flutter/material.dart';
import 'package:tasqrauth/screens/screen72.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController ema = new TextEditingController();
  TextEditingController pas = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text('Signup'),
      ),
      body: Container(
        child: Form(
            child: Column(
          children: [
            Text(
              'Email Id',
              textAlign: TextAlign.left,
            ),
            TextFormField(
              controller: ema,
            ),
            Text(
              'Password',
              textAlign: TextAlign.left,
            ),
            TextFormField(
              controller: pas,
            ),
            ElevatedButton(
                onPressed: () {
                  _auth
                      .createUserWithEmailAndPassword(
                          email: ema.text, password: pas.text)
                      .then((x) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Signin())));
                  });
                },
                child: Text('Submit')),
            Row(
              children: [
                Text('Already a User'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signin()));
                    },
                    child: Text('Signin'))
              ],
            )
          ],
        )),
      ),
    );
  }
}
