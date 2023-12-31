import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'home.dart';
import 'login.dart';
import 'my_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  Future register() async {
    var url = Uri.parse("http://192.168.107.177/bdm_travels/php/register.php");
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User already exists!'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration Successful'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
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
            height: 440,
            width: MediaQuery.of(context).size.width * 0.85,
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
                children: [
                  customTextField(
                    labelText: "Username",
                    hintText: "Full Name",
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextField(
                    labelText: "Email",
                    hintText: "Email Address",
                    prefixIcon: Icons.email,
                    controller: user,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextField(
                    labelText: "Password",
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    controller: pass,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextField(
                    labelText: "Confirm Password",
                    hintText: "Confirm Password",
                    prefixIcon: Icons.lock,
                    controller: cpass,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.3),
                        onPrimary: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "  Already have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 14),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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
