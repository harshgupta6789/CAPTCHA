import 'package:captcha/captcha.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Captcha Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = TextEditingController(),
      password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: TextField(
                  controller: username,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: "Enter username", labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  if (username.value.text == "harshgupta" &&
                      password.value.text == "abcd1234") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Captcha()));
                  } else {
                    Toast.show("Invalid credentials", context);
                  }
                },
              )
            ],
          ),
        ));
  }
}
