import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  late String username;
  late String password;
  late Future<SharedPreferences> reference = SharedPreferences.getInstance();
  login() async {
    final _reference = await reference;
    var data = FormData.fromMap(
        {'email': username, 'password': password, 'model': 'bharani'});
    print(username);
    print(password);
    final dio = Dio();
    final response =
        await dio.post('https://qa.godavarirss.org/api/Auth/Login', data: data);
    var responsedata = response.data;
    _reference.setString('token', responsedata['key']);
    print(_reference.getString('token'));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        // ignore: sort_child_properties_last
        child: Padding(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: prefer_const_constructors
              Text(
                'Welcome Back',
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_constructors
              Text(
                'Welcome Back! Please Enter Your Details:',
              ),
              // ignore: prefer_const_constructors
              TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Enter Your Email'),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              // ignore: prefer_const_constructors
              TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: prefer_const_constructors
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Checkbox(
                        value: false,
                        activeColor: Colors.blue,
                        onChanged: null,
                        checkColor: Colors.blue,
                        focusColor: Colors.black,
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "remember me for 30 days",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  TextButton(
                    child: const Text("forgot password"),
                    onPressed: () {},
                  )
                ],
              ),
              // ignore: prefer_const_constructors
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                      // ignore: prefer_const_constructors
                      backgroundColor: MaterialStatePropertyAll(
                          // ignore: prefer_const_constructors
                          Color.fromARGB(255, 114, 33, 243))),
                  onPressed: () {
                    login();
                  },
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Sign in',
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Color.fromARGB(255, 243, 234, 234)),
                  )),
              // ignore: prefer_const_constructors
              Padding(padding: EdgeInsets.only(top: 10)),
              // ignore: prefer_const_constructors
              ElevatedButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                      // ignore: prefer_const_constructors
                      backgroundColor: MaterialStatePropertyAll(
                          // ignore: prefer_const_constructors
                          Color.fromARGB(255, 223, 213, 213))),
                  onPressed: () {},
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Sign in with Google",
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.black),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't  have  an account?"),
                  TextButton(child: const Text("sign up"), onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
