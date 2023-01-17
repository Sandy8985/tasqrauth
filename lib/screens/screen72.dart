import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasqrauth/screens/screen1.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController ema = new TextEditingController();
  TextEditingController pas = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text('SignIn'),
        centerTitle: true,
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
                      .signInWithEmailAndPassword(
                          email: ema.text, password: pas.text)
                      .then((x) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Home())));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
                child: Text('Submit'))
          ],
        )),
      ),
    );
  }
}
