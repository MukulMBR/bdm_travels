import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'admin/admin_home.dart';
import 'home.dart';
import 'registration.dart';
import 'my_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLoading = false;

  void validateCredentials() async {
    if (user.text == 'Mukul' && pass.text == 'Mukulmbr67!') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHome()),
      );
    } else {
      setState(() {
        isLoading = true;
      });
      await login();
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> login() async {
    try {
      var url = Uri.parse("http://192.168.107.177/bdm_travels/php/login.php");
      var response = await http.post(url, body: {
        "username": user.text,
        "password": pass.text,
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data == "Success") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Successful'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Username and password invalid'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to connect to the server'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("res/bdm.jpg"),
            fit: BoxFit.fill,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.cyan.shade300,
              Color.fromARGB(255, 26, 95, 151),
              Color.fromARGB(255, 5, 152, 172),
              Colors.cyan.shade300,
            ],
          ),
        ),
        child: Center(
          child: GlassContainer(
            height: 315,
            width: MediaQuery.of(context).size.width * 0.8,
            blur: 95,
            color: Colors.white.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.grey.withOpacity(0.3),
              ],
            ),
            border: Border.fromBorderSide(BorderSide.none),
            shadowStrength: 5,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            shadowColor: Colors.white.withOpacity(0.24),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  customTextField(
                    labelText: 'Email / Username',
                    hintText: 'Email address',
                    controller: user,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 20),
                  customTextField(
                    labelText: "Password",
                    hintText: "Password",
                    controller: pass,
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: isLoading
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            color: Colors.pink,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              validateCredentials();
                            },
                          ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Register now",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
