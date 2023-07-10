import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'registration.dart';
import 'my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          height: 295,
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
            child: Column(
              children: [
                customTextField(
                    labelText: 'Email / Username',
                    hintText: 'Email address',
                    prefixIcon: Icons.email),
                SizedBox(
                  height: 20,
                ),
                customTextField(
                    labelText: "Password",
                    hintText: "Password",
                    prefixIcon: Icons.lock),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
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
                              fontSize: 14),
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
    );
  }
}
